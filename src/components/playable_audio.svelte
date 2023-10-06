<script lang="ts">
  import { sound } from "svelte-sound";
  import { ButtonGroup, Card } from "flowbite-svelte";
  import { Alert } from "flowbite-svelte";
  import { InfoCircleSolid } from "flowbite-svelte-icons";

  export let audioSource: string;
  export let audioImgPath: string;
  export let audioName: string;

  let reversedAudioBlob: Blob | null;
  let endpoint = "https://audio-reverse.onrender.com/reverse_wav";
  let badResponse: boolean = false;

  function playReversed() {
    if (reversedAudioBlob) {
      const ctx = new AudioContext();
      const elem = new Audio();

      elem.src = URL.createObjectURL(reversedAudioBlob);
      elem.controls = true;
      elem.autoplay = true;

      document.body.appendChild(elem); // Add audio element to the page
      elem.addEventListener("ended", () => {
        ctx.close();
        document.body.removeChild(elem); // Remove audio element when playback ends
      });
    }
  }

  async function reverseAudio() {
    try {
      const fileResponse = await fetch(audioSource);
      const audioBlob = await fileResponse.blob();

      const formData = new FormData();
      // Use the same field name "audioFile" that your Flask backend expects
      formData.append("contents", audioBlob, "my-name-is-jeff.wav");

      const response = await fetch(endpoint, {
        method: "POST",
        body: formData,
      });

      if (response.ok) {
        const audioArrayBuffer = await response.arrayBuffer();
        const audioBlob = new Blob([audioArrayBuffer], { type: "audio/wav" });
        reversedAudioBlob = audioBlob;
      }
    } catch (error) {
      badResponse = true;
    }
  }
</script>

<div>
  <Card img={audioImgPath} class="mb-4">
    <h5
      class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
    >
      {audioName}
    </h5>
    <ButtonGroup>
      <button
        use:sound={{ src: audioSource, events: ["click"] }}
        type="button"
        class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
        Play
      </button>
      <button
        on:click={reverseAudio}
        type="button"
        class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
        Reverse
      </button>
      {#if reversedAudioBlob}
        <button
          class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          type="button"
          on:click={playReversed}>Play Reversed</button
        >
      {/if}
    </ButtonGroup>
    <!-- if there was a bad response from the backend -->
    {#if badResponse}
      <Alert border>
        <InfoCircleSolid slot="icon" class="w-4 h-4" />
        <span class="font-medium">Server Error!</span>
        Bad response from server. Try again.
      </Alert>
    {/if}
  </Card>
</div>
