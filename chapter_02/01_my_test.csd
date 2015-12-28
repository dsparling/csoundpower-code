<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1

instr 1

a1 oscil 0.2, 440, 1
outs a1, a1

endin

</CsInstruments>
<CsScore>

f 1 0 4096 10 1
i 1 0 4

</CsScore>
</CsoundSynthesizer>
