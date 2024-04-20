//seek

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../networks/networkshandler.dart';

Future<void> AddUser() async {
final THISURL =baseURL+'api/User';
var body ={};
print(body);
 final dio = Dio();
var response = await dio.post(THISURL,data: body,);print(response);Get.back();}

Future<void> EditUser() async {
//final file = await pickFile();
final THISURL =baseURL+'api/User';
var body ={};
//var data = FormData.fromMap(body);
print(body);
 final dio = Dio();
var response = await dio.post(THISURL, data: body,);print(response);Get.back();}

Future<void> AddOrder() async {
final THISURL =baseURL+'api/Order';
var body ={};
print(body);
 final dio = Dio();
var response = await dio.post(THISURL,data: body,);print(response);Get.back();}

Future<void> EditOrder() async {
//final file = await pickFile();
final THISURL =baseURL+'api/Order';
var body ={};
//var data = FormData.fromMap(body);
print(body);
 final dio = Dio();
var response = await dio.post(THISURL, data: body,);print(response);Get.back();}

Future<void> AddProduct() async {
final THISURL =baseURL+'api/Product';
var body ={};
print(body);
 final dio = Dio();
var response = await dio.post(THISURL,data: body,);print(response);Get.back();}

Future<void> EditProduct() async {
//final file = await pickFile();
final THISURL =baseURL+'api/Product';
var body ={};
//var data = FormData.fromMap(body);
print(body);
 final dio = Dio();
var response = await dio.post(THISURL, data: body,);print(response);Get.back();}

Future<void> AddCategory() async {
final THISURL =baseURL+'api/Category';
var body ={};
print(body);
 final dio = Dio();
var response = await dio.post(THISURL,data: body,);print(response);Get.back();}

Future<void> EditCategory() async {
//final file = await pickFile();
final THISURL =baseURL+'api/Category';
var body ={};
//var data = FormData.fromMap(body);
print(body);
 final dio = Dio();
var response = await dio.post(THISURL, data: body,);print(response);Get.back();}
