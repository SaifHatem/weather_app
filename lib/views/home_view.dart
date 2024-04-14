// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
// import 'package:weather_app/views/search_view.dart';
// import 'package:weather_app/widgets/no_weather_widget.dart';
// import 'package:weather_app/widgets/weather_widget.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return const SearchView();
//                   },
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.search,
//               // color: Colors.black,
//             ),
//           )
//         ],
//         title: const Text(
//           "Weather App",
//         ),
//       ),
//       body: BlocBuilder<GetWeatherCubit, WeatherState>(
//         builder: (context, state) {
//           if (state is WeatherInitialState) {
//             return const NoWeatherBody();
//           } else if (state is WeatherLoadedSuccessfullyState) {
//             return WeatherBody(
//               wather: state.weatherModel,
//             );
//           } else {
//             return const Text('Ooops ! ,ther was an error');
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GetWeatherCubit _weatherCubit;
  Color _appBarColor = Colors.blue; // Default color

  @override
  void initState() {
    super.initState();
    _weatherCubit = GetWeatherCubit();
  }

  @override
  void dispose() {
    _weatherCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appBarColor, // Set the app bar color
        elevation: 8,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        title: const Text("Weather App"),
      ),
      body: BlocConsumer<GetWeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadedSuccessfullyState) {
            // Weather condition loaded successfully, update app bar color
            setState(() {
              _appBarColor = getThemeColor(state.weatherModel.weatherCondition);
            });
          }
        },
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedSuccessfullyState) {
            return WeatherBody(
              wather: state.weatherModel,
            );
          } else {
            return const Text('Oops! There was an error');
          }
        },
      ),
    );
  }
}
