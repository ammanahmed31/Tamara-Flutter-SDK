// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/enums.dart';
import '../models/errors.dart';
import '../models/models.dart';

abstract class TamaraWithRemoteDataSource {
  /// Initialise Tamara API.
  void setup({
    required String withApiKey,
    TamaraEnvironment environment = TamaraEnvironment.production,
  });

  /// Throws a [ServerException] for all error codes.
  Future<TamaraSession> createSession(TamaraCheckoutPayload payload);
}

class TamaraSDK implements TamaraWithRemoteDataSource {
  factory TamaraSDK() {
    return _singleton;
  }

  TamaraSDK._internal();

  static final TamaraSDK _singleton = TamaraSDK._internal();

  late final String apiKey;
  late final String host;

  @override
  void setup({
    required String withApiKey,
    TamaraEnvironment environment = TamaraEnvironment.production,
  }) {
    if (withApiKey.isEmpty) {
      throw 'Tamara api key cannot be empty';
    }
    apiKey = withApiKey;
    host = environment.host;
  }

  void checkSetup() {
    try {
      apiKey.isNotEmpty && host.isNotEmpty;
    } catch (e) {
      throw 'TamaraSDK did not setup.\nCall TamaraSDK().setup in main.dart';
    }
  }

  @override
  Future<TamaraSession> createSession(TamaraCheckoutPayload payload) async {
    debugPrint('token: $apiKey');
    debugPrint('payload: ${payload.toMap()}');
    checkSetup();
    try {
      final response = await http.post(
        Uri.parse('${host}checkout'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(payload.toMap()),
      );
      debugPrint('session create status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final checkoutSession = TamaraSession.fromJson(jsonDecode(response.body));
        return checkoutSession;
      } else {
        debugPrint(response.body);
        throw ServerException();
      }
    } catch (e, s) {
      log('TamaraSDK.createSession', error: e, stackTrace: s);
      throw ServerException();
    }
  }
}
