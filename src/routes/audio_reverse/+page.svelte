<script lang="ts">
  import { Card } from "flowbite-svelte";
  import { sound } from "svelte-sound";
  import jeff from "../../static/audio/my-name-is-jeff.wav";

  let audioSource = jeff;
  let endpoint = "https://audio-reverse.onrender.com/reverse_wav";

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

      // right now this SHOULD overwrite audioSource which starts as the
      // original jeff audio. so now audioSource = reversed jeff so the normal
      // play button will hopefull play in reverse after this code below runs
      if (response.ok) {
        const audioArrayBuffer = await response.arrayBuffer();
        // Do something with the audio data here
        // For example, you can create a Blob and play it with Svelte sound
        const audioBlob = new Blob([audioArrayBuffer], { type: "audio/wav" });
        const audioUrl = URL.createObjectURL(audioBlob);
        audioSource = audioUrl;
      }
    } catch (error) {
      console.error("ERROR:", error);
    }
  }
</script>

<div class="flex justify-center items-center pt-20">
  <Card>
    <img src="mnij.png" alt="my name is jeff button picture" />

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
</div>
