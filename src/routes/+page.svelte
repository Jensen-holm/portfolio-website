<script>
    import {Heading, Avatar} from "flowbite-svelte";
    import Project from "../components/project_page/project.svelte";
    import Readme from "../components/general/readme.svelte";
</script>


<div class="flex justify-center items-center pt-10">
    <Avatar src="headshot.png" rounded size="xl"/>
</div>

<div class="flex justify-center items-center">
    <Readme
            readmeUrl="https://raw.githubusercontent.com/Jensen-holm/Jensen-holm/main/README.md"
    />
</div>

<div class="flex justify-center items-center p-5">
    <iframe title="" height='160' width='300' frameborder='0' allowtransparency='true' scrolling='no' src='https://www.strava.com/athletes/16742688/activity-summary/a93a82a3b450506f7e1e805f7b490186122ce567'></iframe>
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
                projectName="MLB Tunnel Bot"
                projectImgPath="tunnel_bot_demo.png"
                buttonText="View"
                buttonHref="https://twitter.com/MLBTunnelBot"
                href="https://twitter.com/MLBTunnelBot"
                description="X (formerly twitter) bot that tweets about the best MLB pitch from the day prior by tunnel score, an advanced statistic that I created to measure pitch tunneling."
                newTab={true}
                inProgress={true}
            />

            <Project
                    projectName="Numpy-Neuron"
                    projectImgPath="NN-Demo.gif"
                    buttonText="Try it"
                    buttonHref="https://huggingface.co/spaces/Jensen-holm/Backprop-Playground"
                    href="https://huggingface.co/spaces/Jensen-holm/Backprop-Playground"
                    description="This web app uses a neural network framework that I built from scratch in python, using numpy as the only 3rd party library in the framework itself."
                    newTab={true}
                    inProgress={false}
            />

            <Project
                    projectName="FireTCP"
                    projectImgPath="mojo_logo.webp"
                    buttonText="Source Code"
                    buttonHref="https://github.com/Jensen-holm/FireTCP"
                    href="https://medium.com/@jensen.dev.01/socket-programming-in-mojo-e113f6c8cbef"
                    description="A lightweight TCP socket networking API for the Mojo programming language for building client/server applications"
                    inProgress={false}
                    newTab={true}
            />

            <Project
                projectName="ClusteRGB"
                projectImgPath="ClusteRGB.png"
                buttonText="Try it"
                buttonHref="https://huggingface.co/spaces/Jensen-holm/ClusteRGB"
                href="https://huggingface.co/spaces/Jensen-holm/ClusteRGB"
                description="Cluster an image based on its RGB channel values using KMeans Clustering in your browser"
                inProgress={false}
                newTab={true}
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
                    projectImgPath="bball_time_machine.png"
                    buttonText="Try it"
                    buttonHref="https://huggingface.co/spaces/Jensen-holm/MLBTimeMachine"
                    href="https://huggingface.co/spaces/Jensen-holm/MLBTimeMachine"
                    description="Baseball Monte Carlo simulation web-app. Simulate baseball teams from different era's against each other for up to 1,620 games"
                    newTab={true}
            />

        </div>
    </div>
</div>
