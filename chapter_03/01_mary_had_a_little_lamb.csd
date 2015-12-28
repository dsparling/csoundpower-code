<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 10
nchnls = 2
0dbfs = 1

giSine ftgen 0, 0, 8192, 10, 1
; stereo bus:
gaRevInL init 0
gaRevInR init 0

instr 1

; setup:
iamp = p4 * 0.5
ifreq = cpspch(p5)
idetune = 0.7
index = 3

; envelopes:
kindexenv linseg index, 0.05, (index * 0.5), (p3 - 0.05), 0
kampenv linseg 0, 0.01, iamp, (p3 - 0.01), 0

; tone generators:
aout foscil kampenv, ifreq - idetune, 1, 1, kindexenv, giSine
aout2 foscil kampenv, ifreq + idetune, 1, 1, kindexenv, giSine

; output:
aL, aR pan2 aout, p6
gaRevInL = gaRevInL + aL
gaRevInR = gaRevInR + aR
outs aL, aR

endin

; reverb "instrument":
instr 100
aoutL, aoutR reverbsc gaRevInL, gaRevInR, 0.8, 10000
clear gaRevInL, gaRevInR
kdeclick linseg p4, (p3 - 0.05), p4, 0.05, 0
outs aoutL * kdeclick, aoutR * kdeclick
endin

</CsInstruments>
<CsScore>

; set tempo:
t 0 120

; melody:
i1 0 1 0.6 8.04 0.5
i1 1 1 0.5 8.02
i1 2 1 0.4 8.00
i1 3 1 0.5 8.02
i1 4 1 0.6 8.04
i1 5 1 0.7 8.04
i1 6 1 0.8 8.04

; harmony:
i1 0 2 0.3 7.00
i1 0 2 0.3 7.07
i1 2 2 0.3 7.05
i1 2 2 0.3 7.09
i1 4 2 0.3 7.04
i1 4 2 0.3 7.07
i1 6 2 0.3 7.05
i1 6 2 0.3 7.09
i1 8 2 0.2 7.02
i1 8 2 0.2 7.05
i1 8 2 0.2 7.09
i1 10 1.3 0.3 7.07
i1 11.33 1.7 0.3 7.00
i1 11.33 1.7 0.3 7.07
i100 0 17 0.2

</CsScore>
</CsoundSynthesizer>
