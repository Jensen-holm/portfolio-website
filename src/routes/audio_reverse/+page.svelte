<script lang="ts">
  import blaster from "../../static/audio/blaster-firing.wav";
  import bart from "../../static/audio/bartlaf3.wav";
  import nfl from "../../static/audio/nfl-on-espn.wav";

  import { Alert } from "flowbite-svelte";
  import { InfoCircleSolid } from "flowbite-svelte-icons";
  import PlayableAudio from "../../components/playable_audio.svelte";
</script>

<!-- display the alert that the user has to hit the reverse button first -->
<div class="flex justify-center items-center">
  <div class="flex justify-center items-center pt-10 w-6/12">
    <Alert border>
      <InfoCircleSolid slot="icon" class="w-4 h-4" />
      <span class="font-medium">Default alert!</span>
      To hear the audio play in reverse, you have to press the reverse button to
      send the audio to my API. Then a new 'Play Reversed Audio' button will appear.
    </Alert>
  </div>
</div>

<div class="flex justify-center items-center pt-20">
  <div class="grid grid-cols-2 space-x-5">
    <div class="pb-20">
      <PlayableAudio
        audioImgPath="stormtrooper.jpg"
        audioSource={blaster}
        audioName="Star Wars Blaster"
      />
    </div>
    <div class="pb-20">
      <PlayableAudio
        audioImgPath="bsimp.webp"
        audioSource={bart}
        audioName="Bart Laugh"
      />
    </div>
  </div>
</div>
