<script lang="ts">
  import { GradientButton } from "flowbite-svelte";
  import { sound } from "svelte-sound";
  import nfl from "../../audio/nfl-on-espn.wav";
  import jeff from "../../audio/my-name-is-jeff.wav";
</script>

<button use:sound={{ src: nfl, events: ["click"] }}> Click Me!! </button>
<button use:sound={{ src: jeff, events: ["click"] }}> Click Me!! </button>
