# Generate Status Badge Images

Shield-System lets you generate github style status images for use anywhere e.g. custom badges with tests results.

[![Build Status](https://travis-ci.org/masterthought/shield-system.png?branch=master)](https://travis-ci.org/masterthought/shield-system)

## Background

I really like the travis,code climate and other services badges you can put on your github README and I wanted to make some I could use on
my internal projects and also be able to change the colours and text easily to make badges with different information for different sets of
tests and statuses.

## Install

     gem install shield-system

Requires RMagick so imagemagick needs to be installed. on a mac with brew:

     brew install git (if you don't have git)
     brew install ghostscript
     brew install imagemagick

## Usage

### Create build status preset shields

![Passing]
(https://raw.github.com/masterthought/shield-system/master/examples/images/passing.gif)

![Failing]
(https://raw.github.com/masterthought/shield-system/master/examples/images/failing.gif)

![Pending]
(https://raw.github.com/masterthought/shield-system/master/examples/images/pending.gif)

![Unstable]
(https://raw.github.com/masterthought/shield-system/master/examples/images/unstable.gif)

![Error]
(https://raw.github.com/masterthought/shield-system/master/examples/images/error.gif)

![Unknown]
(https://raw.github.com/masterthought/shield-system/master/examples/images/unknown.gif)

     require 'shield_system'
     require 'presets/github_build_status.rb'

     output_path = File.dirname(__FILE__)
     build_status = GithubBuildStatus.new(output_path)
     build_status.shield(BuildStatus.passing)

### Create custom shields

![Acceptance]
(https://raw.github.com/masterthought/shield-system/master/examples/images/acceptance.gif)

![Functional]
(https://raw.github.com/masterthought/shield-system/master/examples/images/functional.gif)

![EndtoEnd]
(https://raw.github.com/masterthought/shield-system/master/examples/images/end-to-end.gif)

### using a custom shield

     require 'shield_system'

     output_path = File.dirname(__FILE__)
     shield = ShieldSystem.new(output_path)
     shield.github_shield('acceptance','Acceptance Tests',BuildStatus.passing.name,'#25B9E6',BuildStatus.passing.colour,'#0C0861','white')
     shield.github_shield('functional','Functional Tests','108 Passing','#DCB9ED',BuildStatus.passing.colour,'#0C0861','white')
     shield.github_shield('end-to-end','Number of End to End Tests:','500','#F08C4A','#F08C4A','#0C0861','#0C0861')

### changing height and font

![Height]
(https://raw.github.com/masterthought/shield-system/master/examples/images/height.gif)

![Font]
(https://raw.github.com/masterthought/shield-system/master/examples/images/font.gif)

     shield.github_shield('height','Dependencies','up-to-date',BuildStatus.key.colour,BuildStatus.passing.colour,BuildStatus.value.colour,'white',TRANSPARENT_BACKGROUND,FONT_EAGLE,30,15,'arial')
     shield.github_shield('font','GPA','4.0','#25B9E6',BuildStatus.passing.colour,'#0C0861','white',TRANSPARENT_BACKGROUND,FONT_EAGLE,20,13,'times')

### Creating Sparklines

![BarLabel]
(https://raw.github.com/masterthought/shield-system/master/examples/images/build-history-label-bar.gif)
![Bar]
(https://raw.github.com/masterthought/shield-system/master/examples/images/build-history-bar.gif)

![PieLabel]
(https://raw.github.com/masterthought/shield-system/master/examples/images/build-history-label-pie.gif)
![Pie]
(https://raw.github.com/masterthought/shield-system/master/examples/images/build-history-pie.gif)

### sparklines bar and pie

     # labels
     shield.label('build-history-label-bar', 'Build History', '#A8A7A5', 'white', TRANSPARENT_BACKGROUND, FONT_EAGLE, 28, 13)
     shield.label('build-history-label-pie', 'Passing Tests', '#A8A7A5', 'white', TRANSPARENT_BACKGROUND, FONT_EAGLE, 28, 13)
     # sparklines
     shield.sparkline_shield('build-history-bar', :bar, [100, 100, 90, 80, 90, 90, 100, 120, 120, 90, 80, 70, 100, 120])
     shield.sparkline_shield('build-history-pie', :pie, [70])

## Additional Info

github_shield takes several configuration parameters:

   github_shield(shield_name, key_text, status_text, key_colour, status_colour, key_text_colour, status_text_colour, background_colour=TRANSPARENT_BACKGROUND, custom_font=FONT_EAGLE, height=18, font_size=11, font_family='arial', buffer=5)

most are self explanatory but here's some clarification on the last ones:

  * background_colour = by default is TRANSPARENT_BACKGROUND but you can use this to set a specific colour
  * buffer = by default is 5 - this is width added to the text width for the key and value you supply. you can increase the buffer to make more background space to the right of the text.
  * custom_font = this is set to FONT_EAGLE by default. When custom_font is set it ignores font_family. You can turn off custom_font by setting it to NO_CUSTOM_FONT then the font_family will work.
    (custom font is better cross platform otherwise the tests were failing as different OS's render the system fonts differently)

## Develop

Interested in contributing? Great just let me know how you want to help.

