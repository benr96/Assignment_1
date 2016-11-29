# Object Oriented  Programming - DT-228/2
## Assignment 1 Semester 1 2016

### Overview
This program is desgined to look like an operating system for a spaceship. 
It has 7 window states

- Login
- Transition
- Report Summary
- Star Map
- Local solar system
- Ship controls
- Probes

### Login

This page is shown when the system is locked. It has preset text in the login credentials and won't 
let you through to any other screen until it login button has been pressed. If you click a menu option when 
is locked an error sound will play and the login menu will flash.
![Sketch](http://i.imgur.com/sdjvFzI.jpg)

### Transition

This handles the loading screen. It fades the login screen out, fades the rotating logo in. 
When complete it automatically goes to Report summary.

### Report Summary

This is a kind of landing page once you log in. A welcome message will play. It has some basic information about the senario setup
in the program, such as where you are in the universe and some systems status.
![Sketch](http://imgur.com/aR5dqcn.jpg)

### Star Map

On this page you see a star map on the left hand side. It uses the same data file we used for the lab test.
Although I have heavily edited it, I removed data I wasn't using and added more data. 

The current system is listed under the grid and is marked in red on the grid.

You can select up to 36 stars in any order. They will all be connected by a line in the order you select.
The information about each star will be shown on the right hand side when it is selected. You will be able 
to view 4 selections at a time, using the next page and prev page buttons.

The reset button will clear the selected stars.
![Sketch](http://imgur.com/4XEePtH.jpg)

### Local Solar System

On this page you are presented with a 3D rendering of a solar system. This solar system will always have 4 planets,
however the size of each planet, the orbit radius, the initial position and rotation speed will be randomly generated
every time the program runs.

There are two sliders for control on this page. One tilts the camera to view the solar system from different angles,
the other changes the rotation speed, or direction.

You can click any of the planets and some basic information will be shown in the box on the right.
From here you can launch a probe to the planet. The probe information can be viewed in the probe menu.
![Sketch](http://imgur.com/YZgEN2n.jpg)

### Ship Controls

Here you can control certain aspects of the ship, such as the power of the engines, the weapons and the shield.
There are sliders for each element. The values of the sliders effect the colour of the bars above. There are switches
you can switch on or off which wil shut certain components down.

If you put the power output too high you will get warning and flashing lights. You can also cause overheating. If the overall
power output is too high you will cause a reactor failure. This will shut everything down and won't come back online
until the program is restarted.
![Sketch](http://imgur.com/xBDmo8W.jpg)

### Probes

From this menu option you can view more data about each planet you sent a probe to in the solar system map.
Each planet with a probe on it is listed on the left side. Click them to view more data.
The data will be shown in a box on the right. Below that will be a radar.

You can scroll to zoom in to the planet, click and drag to rotate it.
![Sketch](http://imgur.com/jStTq2w.jpg)




### Local Solar System

On this page you are presented with a 3D rendering of a solar system. This solar system will always have 4 planets,
however the size of each planet, the orbit radius, the initial position and rotation speed will be randomly generated
every time the program runs.

There are two sliders for control on this page. One tilts the camera to view the solar system from different angles,
the other changes the rotation speed, or direction.

You can click any of the planets and some basic information will be shown in the box on the right.
From here you can launch a probe to the planet. The probe information can be viewed in the probe menu

### Ship Controls

Here you can control certain aspects of the ship, such as the power of the engines, the weapons and the shield.
There are sliders for each element. The values of the sliders effect the colour of the bars above. There are switches
you can switch on or off which wil shut certain components down.

If you put the power output too high you will get warning and flashing lights. You can also cause overheating. If the overall
power output is too high you will cause a reactor failure. This will shut everything down and won't come back online
until the program is restarted.

### Probes

From this menu option you can view more data about each planet you sent a probe to in the solar system map.
Each planet with a probe on it is listed on the left side. Click them to view more data.
The data will be shown in a box on the right. Below that will be a radar.

You can scroll to zoom in to the planet, click and drag to rotate it.


