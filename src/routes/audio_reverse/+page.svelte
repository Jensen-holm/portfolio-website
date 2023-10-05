<script lang="ts">
  import { Card } from "flowbite-svelte";
  import { sound } from "svelte-sound";
  import jeff from "../../static/audio/my-name-is-jeff.wav";
  import axios from "axios";

  let audioSource = jeff;
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
  </Card>
</div>
