import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AddDeleteUpdatePostState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  MessageAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  ErrorAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}
