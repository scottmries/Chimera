# Chimera

Chimera is a granular synthesizer whose waveforms are generated by analyzing the frames of a live camera with a maximally sized discrete Hilbert curve which samples the pixels with which it intersects and translates them to time- or frequency-domain waveforms which can then be played on a keyboard.

## Development plan

### Beta
- A prototype Android app written in Processing and a basic Audio library
- An interface like a keyboard that mixes the time- and frequency-domains depending on the location of the click/touch along the length of the key, and a menu allowing this configuration or disabled time- or frequency-domain options
- Audio translated to Supercollider
### 1.0
- Translated Openframeworks, with releases for iOS and Android
### 2.0
- Adds the option to output to WebMIDI, allowing live performance worldwide, the synth served with Laravel Forge or Heroku using a Docker environment, and written with a Vue app
### 3.0
- An allowance for recording loops, saved to a database; a Chimera left on a tripod could record a setting sun with the sound encoded as the changes of a loop's timbre

## Future uses

As one instrument in a small set that makes up a composition, Chimera could be coupled with a sometimes-quantized timeline generated by Markov chains controlling percussive sounds generated with additive and frequency-modulation synthesis.
