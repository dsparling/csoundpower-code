<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 4
nchnls = 2
0dbfs = 1

; Vocoder http://csounds.com/udo/displayOpcode.php?opcode_id=53
opcode Vocoder, a, aakkkpp

as1,as2,kmin,kmax,kq,ibnd,icnt  xin

if kmax < kmin then
ktmp = kmin
kmin = kmax
kmax = ktmp
endif

if kmin == 0 then 
kmin = 1
endif

if (icnt >= ibnd) goto bank
abnd   Vocoder as1,as2,kmin,kmax,kq,ibnd,icnt+1

bank:
kfreq = kmin*(kmax/kmin)^((icnt-1)/(ibnd-1))
kbw = kfreq/kq
an  butterbp  as2, kfreq, kbw
an  butterbp  an, kfreq, kbw
as  butterbp  as1, kfreq, kbw
as  butterbp  as, kfreq, kbw
ao balance as, an

amix = ao + abnd

     xout amix

endop

instr 1
;acar1 vco2 0.3, 200
;acar2 vco2 0.3, 250
;acar3 vco2 0.3, 300
acar1 vco2 0.2, p5
acar2 vco2 0.2, p6
acar3 vco2 0.2, p7
acarrier = acar1 + acar2 + acar3
audio loscil 0.5, 1, 1, 1
aout Vocoder acarrier, audio, 200, 10000, 20, 25
outs aout, aout
endin

</CsInstruments>
<CsScore>
i1 0 4 1.0 200 250 300
i1 4 4 1.0 225 300 360
i1 8 4 1.0 250 300 400
f1 0 1048576 1 "i_want_be_dance_with_you.aiff" 0 4 0

</CsScore>
</CsoundSynthesizer>
