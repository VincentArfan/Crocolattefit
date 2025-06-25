import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsProvider with ChangeNotifier {
  final List<NewsModel> _newsList = [
    NewsModel(
      title: 'Routine Health Checks',
      description: 'Routine health checks are essential for early detection of potential health issues, even before symptoms appear. Regular screenings allow individuals to monitor vital signs such as blood pressure, cholesterol, and blood sugar levels.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTks4WMtRqqWBXa7WZ9rAth_MOfODQ8vjwPJZ9w5g2PJ9JKqhsp9vVkA44e0vYYA2x6-ms&usqp=CAU',
    ),
    NewsModel(
      title: 'Heart Health',
      description: 'Heart health is crucial for maintaining overall well-being and preventing serious conditions like heart attacks or strokes. A healthy heart can be supported through regular exercise, a balanced diet, and stress management. ',
      imageUrl: 'https://asset.kompas.com/crops/0kXqJVbpjZihZlRk-aA8g70Kt7c=/0x0:500x333/750x500/data/photo/2022/09/29/63348a53b0c93.jpg',
    ),
    NewsModel(
      title: 'Lung Health',
      description: 'Lung health plays a vital role in ensuring your body gets the oxygen it needs to function properly. Avoiding smoking, staying away from polluted environments, and exercising regularly can help keep your lungs strong. ',
      imageUrl: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1658710314/attached_image/4-fungsi-paru-paru-dan-tips-menjaganya-tetap-sehat.jpg',
    ),
    NewsModel(
      title: 'Fruit with High Vitamins',
      description: 'Fruits rich in vitamins are essential for maintaining a strong immune system and overall health. Citrus fruits like oranges, lemons, and grapefruits are high in vitamin C, which helps fight infections. Mangoes, papayas, and apricots are packed with vitamin A, important for eye and skin health.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrnrqH9dlsGAew6DneQqAfCH28UnHoxLLj2A&s',
    ),
    NewsModel(
      title: 'Gym Routine',
      description: 'Having a consistent gym routine helps improve physical fitness, build muscle, and boost mental well-being. A balanced routine typically includes a mix of strength training, cardio, and flexibility exercises.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKs9YuqIFIFvhV_QwSUgEIVaHEUUDY-eDJew&s',
    ),
    NewsModel(
      title: 'Morning Exercise Outdoors',
      description: 'Morning exercise outdoors is a refreshing way to start the day with energy and positivity. The fresh air and natural sunlight can boost your mood and help regulate your sleep cycle. Activities like jogging, stretching, or cycling in the morning improve circulation and mental clarity. It’s a simple habit that supports both physical and emotional well-being.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT7T4cH_c3MVC7k6X-gcUjy2mpmvOiV1VhWQ&s',
    ),
    NewsModel(
      title: 'Eat Vegetables Often',
      description: 'Eating vegetables often is key to maintaining a healthy and balanced diet. Vegetables are rich in fiber, vitamins, and minerals that support digestion and boost the immune system. Including a variety of colorful veggies ensures you get different nutrients your body needs.',
      imageUrl: 'https://3.imimg.com/data3/SX/KS/MY-18430594/all-fresh-fruits-500x500.jpg',
    ),
    NewsModel(
      title: 'Schedule Exercise',
      description: 'Scheduling exercise helps make physical activity a regular and non-negotiable part of your daily routine. By setting specific times for workouts, you’re more likely to stay consistent and committed. It also helps you balance fitness with work, rest, and other responsibilities. ',
      imageUrl: 'https://assets.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/radarsurabaya/2022/11/shutterstock_1523635688-1.jpg',
    ),
  ];

  List<NewsModel> get newsList => _newsList;
}