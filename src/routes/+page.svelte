<script>
    import {Heading, Img, Tooltip} from "flowbite-svelte";
    import Project from "../components/project_page/project.svelte";
    import Readme from "../components/general/readme.svelte";
</script>

<div class="flex justify-center items-center">
    <div class="grid gap-5 max-sm:grid-cols-1 sm:grid-cols-1 md:grid-cols-3 lg:grid-cols-3 max-lg:grid-cols-3">
        <div class="pt-5">
            <a href="https://whitepine.digital/">
                <Img src="white-pine-digital.jpeg"
                     class="w-40 h-40 object-cover"/>
                <Tooltip>Experience: Full Stack Software Engineer Intern @ White Pine
                    Digital
                </Tooltip>
            </a>
        </div>
        <div class="pt-5">
            <Img src="gentex.png"
                 class="w-40 h-40 object-cover"/>
            <Tooltip>Experience: Machine Learning Engineer Summer 2024</Tooltip>
        </div>
        <div class="pt-5">
            <a href="https://northwoodsleague.com/kalamazoo-growlers/">
                <Img
                        src="kalamazoo-growlers.png"
                        class="w-40 h-40 object-cover"/>
                <Tooltip>Experience: Data Science / Analytics Intern @
                    Kalamazoo Growlers
                </Tooltip>
            </a>
        </div>
    </div>
</div>

<div class="flex justify-center items-center">
    <Readme
            readmeUrl="https://raw.githubusercontent.com/Jensen-holm/Jensen-holm/main/README.md"
    />
</div>

<div class="min-h-screen h-screen">
    <div class="pt-10 pb-5">
        <div class="text-center">
            <Heading tag="h2"
                     class="mb-4"
                     customSize="text-5xl font-extrabold p-10"
            >Projects
            </Heading
            >
        </div>
    </div>

    <div class="flex justify-center items-center">
        <div class="grid gap-4 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
            <Project
                    projectName="FireTCP"
                    projectImgPath="mojo_logo.webp"
                    buttonText="Source Code"
                    buttonHref="https://github.com/Jensen-holm/FireTCP"
                    href="https://medium.com/@jensen.dev.01/socket-programming-in-mojo-e113f6c8cbef"
                    description="A lightweight TCP socket networking API for the Mojo programming language for building client/server applications"
                    inProgress={false}
            />

            <Project
                    projectName="Neural network algorithm from scratch"
                    projectImgPath="tree-backprop.gif"
                    buttonText="Try it"
                    buttonHref="/machine_learning_from_scratch"
                    href="/machine_learning_from_scratch"
                    description="Test out a neural network classification algorithm I built from scratch using your own data."
            />

            <Project
                    projectName="G3N Graphics library wrapper & physics engine"
                    projectImgPath="g3n-wrapper.gif"
                    buttonText="Source code"
                    buttonHref="https://github.com/Jensen-holm/g3n-wrapper"
                    href="/g3n-wrapper"
                    description="Wrapper package with built in physics engine for the G3N graphics package in Go."
                    inProgress={false}
                    newTab={true}
            />

            <Project
                    projectName="Monte Carlo baseball time machine"
                    projectImgPath="bball_time_machine.gif"
                    buttonText="Try it"
                    buttonHref="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
                    href="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
                    description="Baseball Monte Carlo simulation web-app. Simulate baseball teams from different era's against each other for up to 1,620 games"
                    newTab={true}
            />

            <Project
                    projectName="My Portfolio Website"
                    projectImgPath="svelte-kit-tailwind.jpg"
                    buttonText="Source code"
                    buttonHref="/webpage"
                    href="/webpage"
                    description="I built this website using svelte-kit and tailwind css for a simple, lightweight, & responsive application."
                    inProgress={true}
            />

            <Project
                    projectName="HPC-Sandbox"
                    projectImgPath="https://raw.githubusercontent.com/Chemsim-HPC/HPC-Sandbox/main/demos/benchmark_demo.gif"
                    buttonText="Source Code"
                    buttonHref="https://github.com/Chemsim-HPC/HPC-Sandbox"
                    href="https://github.com/Chemsim-HPC/HPC-Sandbox"
                    description="High performance computing (HPC) sandbox for testing different HPC methods before getting involved in HPC undergraduate research at GVSU."
                    inProgress={true}
            />

        </div>
    </div>
</div>
