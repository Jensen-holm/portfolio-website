<script>
  import { DeviceMockup } from "flowbite-svelte";
</script>

<div class="grid grid-cols-1 pt-10">
  <div>
    <DeviceMockup device="ios">
      <img
        src="phone.gif"
        alt="This webpage but on a phone"
        class="hidden dark:block w-[272px] h-[572px]"
      />
      <img
        src="phone.gif"
        alt="This webpage but on a phone"
        class="dark:hidden w-[272px] h-[572px]"
      />
    </DeviceMockup>
  </div>

  <div class="pt-20 pb-20">
    <DeviceMockup device="laptop">
      <img
        src="desktop.gif"
        alt="This webpage but on a laptop"
        class="hidden dark:block h-[156px] md:h-[278px] w-full rounded-lg"
      />
      <img
        src="desktop.gif"
        alt="this webpage but on a laptop"
        class="dark:hidden h-[156px] md:h-[278px] w-full rounded-xl"
      />
    </DeviceMockup>
  </div>
</div>
