{ config, ... }:

{
	services.libinput = {
		enable = true;

		touchpad = {
			tapping = true;
			scrollMethod = "twofinger";
			naturalScrolling = true;
			disableWhileTyping = true;
			accelProfile = "adaptive";
		};
	};
}
