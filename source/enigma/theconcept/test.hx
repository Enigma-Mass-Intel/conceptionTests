package source.enigma.theconcept;

import flixel.FlxG;

import enigma.data.User;

import enigma.scenes.ErrorScene;

import enigma.theconcept.data.Users;
import enigma.theconcept.server.Server;
import enigma.theconcept.server.Client;
import enigma.theconcept.scenes.Limbo;

class Test {

  // multiplayer
  var server = new Server();
  var client = new Client();

  // user without 3d model or movement
  var curUser = new User(false, false);

  // array of dev users
  var devUsers = new Users();

  public function new() {
    super();
  }

  public static function test() {

    // check for client or server being offline
    if (!client.online) try { client.setup(); } catch(e) { errorSwitch(e); break; }
    if (!server.online) try { server.setup(); } catch(e) { errorSwitch(e); break; }

    // move to limbo
    if (devUsers.userArray.contains(curUser.username)) { 
        FlxG.switchState(new Limbo(server, client, curUser)); 
    }

  }

  private function errorSwitch(err) {
    FlxG.switchState(new ErrorScene(err));
  }
  
}
