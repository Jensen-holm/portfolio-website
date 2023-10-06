<script>
  import { Card, GradientButton, Heading } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<div class="min-h-screen h-screen">
  <div class="pt-10 pb-5">
    <div class="text-center">
      <Heading
        tag="h2"
        class="mb-4"
        customSize="text-4xl font-extrabold  md:text-5xl lg:text-6xl"
        >Projects</Heading
      >
    </div>
  </div>

  <div class="flex justify-center items-center">
    <div class="grid gap-4 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 p-4">
      <Card href="/neural_network" class="mb-4">
        <img
          src="tree-backprop.png"
          alt="Neural Network from scratch"
          class="w-full h-auto object-contain"
        />
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          Neural Network from scratch
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          I implemented algorithms to build a neural network from scratch. Do
          some hyper parameter tuning with this neural network on the iris
          dataset.
        </p>
        <GradientButton class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>

      <Card href="https://github.com/Jensen-holm/g3n-wrapper" class="mb-4">
        <img
          src="g3n-wrapper-screenshot.png"
          alt="graphics engine screenshot"
          class="w-full h-auto object-contain"
        />
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          G3N wrapper & physics engine
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          I built a wrapper for the G3N graphics engine in Go with a built in
          physics engine.
        </p>
        <GradientButton
          class="w-fit"
          href="https://github.com/Jensen-holm/g3n-wrapper.git"
        >
          Source Code<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>

      <Card
        href="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
        class="mb-4"
      >
        <img
          src="sim.png"
          alt="Monte Carlo Baseball Time Machine"
          class="w-full h-auto object-contain"
        />
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          Monte Carlo Baseball Time Machine
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          Use a Monte Carlo Baseball simulator that I built to see how
          professional baseball teams from different era's stack up against each
          other.
        </p>
        <GradientButton
          class="w-fit"
          href="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
        >
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>

      <Card href="/audio_reverse" class="mb-4">
        <img
          src="reverse.png"
          alt="uno reverse your audio"
          class="w-full h-auto object-contain"
        />
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          Audio Reverse
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          Pull the Uno-Reverse card on your audio by interacting with this REST
          API that I built.
        </p>
        <GradientButton class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>
      <Card href="/webpage" class="mb-4">
        <img
          src="svelte-kit-tailwind.jpg"
          alt="This website built with svelte kit and tailwind"
          class="w-full h-auto object-contain"
        />
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          This Very Website
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          This website was built with Svelte-Kit, tailwind, and Flowbite-svelte
          to be lightweight, responsive and organized without sacraficing ease
          of development
        </p>
        <GradientButton
          class="w-fit"
          href="https://github.com/Jensen-holm/website"
        >
          Source Code<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>
    </div>
  </div>
</div>
