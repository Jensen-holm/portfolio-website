<script lang="ts">
  import nfl from "../../static/audio/nfl.wav";
  import blaster from "../../static/audio/blaster-firing.wav";
  import mail from "../../static/audio/youGotmail.wav";
  import shakeNBake from "../../static/audio/shake-bake.wav";

  import { Alert } from "flowbite-svelte";
  import { InfoCircleSolid } from "flowbite-svelte-icons";
  import PlayableAudio from "../../components/audio_reverse/playable_audio.svelte";
</script>

<!-- display the alert that the user has to hit the reverse button first -->
<div class="flex justify-center items-center">
  <div class="flex justify-center items-center pt-10 w-6/12">
    <Alert border>
      <InfoCircleSolid slot="icon" class="w-4 h-4" />
      <!-- <span class="font-medium">Warning!</span> -->
      In order to hear the audio play in reverse, you have to first press the 'Reverse'
      button that sends the audio file to my audio reverse API. A green indicator
      will appear when you are able to press 'Play Reverse'.
    </Alert>
  </div>
</div>

<div class="flex justify-center items-center pt-20">
  <div class="grid gap-4 sm:grid-cols-1 md:grid-cols-2 p-4">
    <div class="pb-20">
      <PlayableAudio
        audioImgPath="aol.jpg"
        audioSource={mail}
        audioName="AOL"
      />
    </div>

    <div class="pb-20">
      <PlayableAudio
        audioImgPath="nfl.webp"
        audioSource={nfl}
        audioName="NFL Theme"
      />
    </div>

    <div class="pb-20">
      <PlayableAudio
        audioImgPath="stormtrooper.jpg"
        audioSource={blaster}
        audioName="Star Wars Blaster"
      />
    </div>

    <div class="pb-20">
      <PlayableAudio
        audioImgPath="talladega.jpg"
        audioSource={shakeNBake}
        audioName="Shake & Bake"
      />
    </div>
  </div>
</div>
