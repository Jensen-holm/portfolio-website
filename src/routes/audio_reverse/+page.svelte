<script>
  import { Card } from "flowbite-svelte";
  import { sound } from "svelte-sound";
  import jeff from "../../static/audio/my-name-is-jeff.wav";

  let audioSource = jeff;
  let reversedAudioBlob = null;
  let endpoint = "https://audio-reverse.onrender.com/reverse_wav";

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
        // const audioUrl = URL.createObjectURL(audioBlob);
        reversedAudioBlob = audioBlob;
      }
    } catch (error) {
      console.error("ERROR:", error);
    }
  }
</script>

<div class="flex justify-center items-center pt-20">
  <Card>
    <img src="mnij.png" alt="my name is jeff" />

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
  </Card>
  <button on:click={playReversed}>Play Reversed Audio</button>
</div>
