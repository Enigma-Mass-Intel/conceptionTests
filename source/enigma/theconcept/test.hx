package source.enigma.theconcept;

import flixel.FlxG;

import enigma.data.User;

import enigma.scenes.ErrorScene;

import enigma.theconcept.server.Server;
import enigma.theconcept.server.Client;
import enigma.theconcept.scenes.Limbo;

class Test {

  var server = new Server();
  var client = new Client();
  var curUser = new User(false);

  public function new() {
    super();
  }

  public static function test() {
    if (!client.online) try { client.setup(); } catch(e) { errorSwitch(e); break; }
    if (!server.online) try { server.setup(); } catch(e) { errorSwitch(e); break; }

    FlxG.switchState(new Limbo(server, client, curUser));
  }

  private function errorSwitch(err) {
    FlxG.switchState(new ErrorScene(err));
  }
  
}
