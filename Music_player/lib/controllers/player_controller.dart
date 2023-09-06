import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

// what GetxController do ?

/*
  Getx ----> provides you with a class capable of initializing data,
  and removing it when it is no longer needed,

  The GetX Controller -----> class controls the state of the UI when
  you wrap an individual widget with its Observer so that it only
  rebuilds when there is a change in the state of that particular
  widget.
*/

class PlayerController extends GetxController {

  final audioQuery = OnAudioQuery() ;
  final audioPlayer = AudioPlayer() ;

  /*
  ---> Add . obs to any variable and you make it observable.
  ---> You're turning buttonName type String .
  --> This means that we can listen to the changes made to buttonName our view using GetX .
 -> We use update() the method inside any method in the controller so that our widgets can
  listen to the changes made by the method.
  */

  var playIndex = 0.obs ;
  var isPlaying = false.obs ;

  var duration = ''.obs ;
  var position = ''.obs ;

  var max = 0.0.obs ;
  var value = 0.0.obs ;

  @override
  void onInit() {
    super.onInit();
    checkPermission() ;
  }

  updatePosition() {

    audioPlayer.durationStream.listen((d) {

      duration.value = d.toString().split(".")[0] ;
      max.value = d!.inSeconds.toDouble() ;

    }) ;

    audioPlayer.positionStream.listen((p) {

      position.value = p.toString().split(".")[0] ;
      value.value = p.inSeconds.toDouble() ;

    }) ;

  }

  changeDurationToSeconds(seconds) {

    var duration = Duration(seconds: seconds) ;
    audioPlayer.seek(duration) ;

  }

  playSong(String? uri , index) {

    playIndex.value = index ;

    try {

      audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse(uri!))
      );

      audioPlayer.play() ;
      isPlaying(true) ;
      updatePosition() ;

    } on Exception catch(e) {

      print(e.toString()) ;

    }

  }

  checkPermission() async {

    var perm = await Permission.storage.request() ;

    if(perm.isGranted) {}

    else {

      checkPermission() ;
    }

  }

}

/*
    The “await” keyword is used to wait for the result of an
    asynchronous operation before proceeding to the next line
    of code.
*/






