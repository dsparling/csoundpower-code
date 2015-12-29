<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 4
nchnls = 2
0dbfs = 1
; Stereo send bus
gaDelaySendL init 0
gaDelaySendR init 0

; Slightly more complex instrument
instr 1
kphasramp line 0.1, p3, 1.5
klfo lfo 1, (0.1 + kphasramp), 2
aphas phasor (klfo - kphasramp)/20
aphas2 phasor (klfo + kphasramp)/20
ifilelength = 709288
aphas = aphas * ifilelength
aphas2 = aphas2 * ifilelength
audioL table aphas, 1
audioR table aphas2, 1
; Send left and right signals from the sample play to this bus.
; Reverse sends - send the right channel to the left bus and vice versa.
gaDelaySendL = audioR
gaDelaySendR = audioL
outs audioL, audioR
endin

; "Delay" instrument
instr 100
ilevel = p4
ifeedback = p5
itimeL = p6
itimeR = p7
ainL = gaDelaySendL
ainR = gaDelaySendR
gaDelaySendL = 0
gaDelaySendR = 0
adeloutR init 0
adeloutL delayr itimeL
        delayw ainL + (adeloutR * ifeedback)
adeloutL dcblock2 adeloutL
adeloutR delayr itimeR
        delayw ainR + (adeloutL * ifeedback)
adeloutR dcblock2 adeloutR
adeloutL = adeloutL * ilevel
adeloutR = adeloutR * ilevel
outs adeloutL, adeloutR
endin

</CsInstruments>
<CsScore>
f1 0 1048576 1 "olive.aiff" 0 4 0
f2 0 8192 10 1
i1 0 26
i100 0 30 0.5 0.3 0.5 0.75

</CsScore>
</CsoundSynthesizer>
