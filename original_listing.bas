 10 RELEASE:HIMEM#97FF
 11 CLS:PAPER0:INK1:PLOT3,5,"House of Death"
 12 PLOT12,7,"By G.M. Phillips. 1983"
 13 Z=10:GOSUB6500:WAIT300
 15 GOSUB60000:PRINT"The House of Death":PRINT:PRINT"Please wait...";:GOSUB1500
 20 TEXT
 40 CLS:PRINT"Would you like instructions?"
 50 GETZ$:IFZ$="N"THEN200
 60 IFZ$<>"Y"THEN40
 65 INK2
 70 CLS:PRINTCHR$(4):PRINTCHR$(27)"JWelcome to the house of death":PRINT:PRINTCHR$(4)
 80 PRINT"You are outside an old, crumbling ruin of a place where horror movies were
 90 PRINT"once made.  The building was shut downafter various REAL hauntings and
 100 PRINT"has remained untouched for many many  years. It is rumoured that any
 110 PRINT"fool who would risk going inside could find as many as FIVE ";
 120 PRINT"treasures":PRINT:PRINT:PRINT"Please press any key
 130 GETZ$
 140 CLS:PAPER0:INK6:PRINT"You must enter your actions as simple
 150 PRINT"sentences in CAPITALS"
 160 PRINT"such as GET THE ORANGE or DROP FISH
 180 PRINT:PRINT"Indicate directions by using compass  points, e.g. GO NORTH, or WALK
 182 PRINT"EAST. CLIMB STAIRS or ENTER HUT are   also acceptable.
 184 PRINT:PRINT"Special commands are TAKE INVENTORY   (or I) to find out what you
 186 PRINT"are carrying.":PRINT"LOOK AT THING can sometimes help you.
 188 PRINT"SCORE shows your rating, and ends the game if you have 100%!
 192 PRINT"QUIT terminates the program"
 194 PRINT"SAVE saves your position on cassette  and LOAD brings it back"
 196 PRINT"please type any key":GETZ$
 198 GOSUB6800
 200 CLS:PRINT"Please select INK (0-7) or hit RETURN":GETZ$
 202 IFVAL(Z$)>0ANDVAL(Z$)<8THENINKVAL(Z$)
 210 TH=18:TM=30:RR=-1:R=1:S=0
 400 REM AUTOS
 401 GOSUB8500
 402 IFR=RRTHEN405
 403 RR=R:Z=R:GOSUB4000:FORZ=1TO37:IFI(Z)<>RTHENNEXT:GOTO405
 404 GOSUB3000:NEXT
 405 IFR<>25THEN430
 410 Z=0:GOSUB30300
 420 IFT>78ORI(14)=-1THENZ=1:GOSUB2000:R=45:I(4)=25
 430 REM
 440 IFI(23)=RAND(I(1)=-1ORI(1)=R)THENZ=27:GOSUB2000:I(1)=0:I(23)=0
 450 IFI(25)=RAND(I(13)=-1ORI(13)=R)THENZ=29:GOSUB2000:I(25)=0
 460 IFI(26)=RANDI(3)=-1THENZ=28:GOSUB2000:I(26)=0
 470 IFI(23)=RANDRND(9)<.2THENPRINT"The mummy suddenly grabs you..":R=57
 480 IFI(25)=RANDRND(9)<.2THENPRINT"The vampire decides to have a snack..":R=57
 490 IFI(26)=RANDRND(9)<.4THENPRINT"With a snarl the thing leaps at you..":R=57
 495 IFR=57THEN31000
 496 IFR=24THENGOSUB7000ELSEPLAY0,0,0,0
 500 PRINT:PRINT:PRINT"Please enter a command":INPUTI$:GOSUB9000:PRINT:PRINT:PRINT:PRINT
 505 TM=TM+1:IFTM>59THENTM=0:TH=TH+1:GOSUB39000:IFTH>23THENTH=0
 507 Z$=MID$(STR$(TM),2):IFTM<10THENZ$="0"+Z$
 510 Z$="TIME: "+MID$(STR$(TH),2)+"."+Z$+"  "
 520 FORZ=1TOLEN(Z$):POKE#BB80+Z,ASC(MID$(Z$,Z,1)):NEXT
 540 GOSUB31500:GOSUB31400
 550 IFV=2ANDN$="INVE"THENGOSUB30100:GOTOO
 555 IFV=1THENRR=-1
 560 IFV$="SCOR"ORN$="SCOR"THENGOSUB30000:GOTOO
 570 IFV$="QUIT"THEN31200
 580 IFV$="SAVE"THENGOSUB30700:GOTOO
 590 IFV$="LOAD"THENGOSUB30800:GOTOO
 595 IFI$="LOOK"ORV$="L"THENRR=0:GOTOO
 600 IFVAL(I$)>0ANDVAL(I$)=FRTHENR=55:GOTOO
 610 IFV$="HELP"THENPRINT"Sorry, this is not a game you know!":GOTOO
 620 IFV$="INFO"THENPRINT"Written by G.M. Phillips 1983":GOTOO
 630 GOTO5000
 635 IFN$="ALL"THEN710
 640 IFN=0THEN8000
 700 IFV=1THENGOSUB30600:GOTOO
 710 IFV=2ORV=3THENGOSUB30200:GOTOO
 720 GOTO8000
 1500 DIMG%(36),N$(77),N(77),V$(77),V(77),GT%(57,12),I(37),W%(36),F(6),JU(6)
 1510 DIMIM$(12)
 1511 O=400
 1515 FORZ=1TO36:READG%(Z):NEXT
 1520 DATA7,8,9,10,0,0,0,13,12,15,16,17,18,19,0,0,0,24,25,0,0,0,0,29,0,0,0
 1530 DATA33,34,0,38,0,0,0,0,41
 1540 FORZ=1TO77:READN$(Z),N(Z):NEXT
 1550 DATANORT,1,SOUT,2,EAST,3,WEST,4,UP,5,DOWN,6,LEAV,7,SCUB,8,DIVI,8
 1560 DATAMASK,9,HOLE,10,TANK,11,WATE,11,CHAN,12,MATT,13,BED,13,SLEEP,14
 1570 DATATADP,15,FISH,15,PHIA,16,LIQU,16,ACID,16,FROG,17,GARL,18
 1580 DATAWEIG,19,KEEP,19,TRAP,20,BOLT,21,CARP,22,MIRR,23,BRAS,24,KEY,24
 1590 DATARENO,25,PAIN,25,PICT,25,PORT,25,SAFE,26,DOOR,27,HUGE,27
 1600 DATAMUMM,28,GOLD,29,SCEP,29,DRAC,30,VAMP,30,WERE,31,FLOO,32
 1610 DATACAKE,33,EAT-,33,BUN,34,EM-T,34,NOTE,35,HOME,36,RAIN,37,CRYS,38
 1620 DATAORC,38,KNOC,39,BELL,40,BRAC,41,SILV,41,MASK,42,WALL,43,BANN,44
 1630 DATASTAI,45,BUTT,46,BIKE,47,EXER,47,BICY,47,MILE,48,WIND,49,ROOM,50 
 1640 DATAWITC,51,CAUL,52,GATE,53,OUT,54,SHED,55,CHUT,56,IEXPLODE,57
 1650 FORZ=1TO77:READV$(Z),V(Z):NEXT
 1660 DATA GO,1,WALK,1,RUN,1,TRAV,1,ENTE,1,CLIM,1,SWIM,1,DIVE,1,LIE,1
 1670 DATA GET,2,LIFT,2,TAKE,2,STEA,2,RAIS,2,WEAR,2,DROP,3,LEAV,3,PUT,3,GIVE,3
 1680 DATA THRO,3,ABAN,3,OPEN,4,UNLO,4,CLOS,5,LOCK,5,EAT,6,DRIN,6,CONS,6
 1690 DATAKILL,7,ATTA,7,HURT,7,HIT,7,DEST,7,KICK,7,FIGH,7 
 1700 DATAEXAM,8,LOOK,8,READ,8,BUIL,9,MAKE,9,EXER,10,USE,11,SLEE,12,BREA,14 
 1710 DATASMAS,14,CRAC,14,UNDO,15,LOOS,15,TURN,15,UNSC,15,REMO,15,MOVE,16
 1720 DATAPUSH,16,PULL,16,PRES,16,EMPT,17,POUR,17,FRIG,18,BOO,18,DIG,19,FLY,20
 1730 DATA TURN,21,KNOC,22,RAP,22,RING,23,SLID,24,RIDE,25,FIND,26,HOME,27
 1740 DATA TOTO,27,THER,27,YOHO,28,XYZZ,28,PLUG,28,ABRA,28,HOCU,28
 1750 DATAPANI,29
 1800 FORY=1TO57:FORZ=0TO14:READV:IFV=0THENNEXTY:GOTO1820
 1810 GT%(Y,Z)=V:NEXTZ,Y
 1820 DATA1,6,2,2,3,3,4,4,27,6,0,1,1,2,2,3,3,4,4,0,1,3,2,2,3,3,4,1,0
 1825 DATA1,4,2,4,3,1,4,4,0,0,2,1,3,19,4,11,5,25,45,25,54,1,0,1,11,54,11,0
 1830 DATA3,11,54,11,0,3,12,54,12,0,0,1,12,2,7,3,6,4,8,57,8,0
 1835 DATA1,13,2,11,4,9,57,9,0,1,26,2,12,3,14,0,3,15,4,13,0
 1840 DATA3,16,4,14,2,17,57,16,0,4,15,54,15,0,1,15,2,19,3,18,57,18,0
 1845 DATA4,17,54,17,0,1,17,4,6,3,20,57,20,0,2,21,4,19,54,19,0,1,20,2,22,0
 1850 DATA1,21,2,23,,1,22,,5,23,54,23,,5,28,6,6,45,28,,2,13,3,27,55,27,57,27,0
 1855 DATA4,26,54,26,0,1,36,3,30,4,34,6,25,45,25,57,36,0,1,30,4,35,0
 1860 DATA1,28,2,29,3,31,0,1,33,3,32,4,30,0,4,31,54,31,0,2,31,54,31,0
 1865 DATA3,28,2,35,0,1,34,3,29,5,37,45,37,0,2,28,54,28,0,1,38,6,35,45,35,0
 1870 DATA2,37,23,39,0,4,38,1,57,2,40,3,42,0,1,39,2,41,3,57,0,1,40,3,56,6,57,0
 1875 DATA1,57,2,43,4,39,0,1,42,4,39,0,2,56,49,56,0,0,4,45,3,47,53,47,0
 1880 DATA4,46,1,51,53,46,0,1,49,54,49,0,1,52,2,48,54,52,0,51,3,53,0 
 1885 DATA1,52,2,47,3,50,0,4,49,3,51,0,4,50,3,54,56,54,0,0,0,1,44,4,41,49,44,57
 1890 DATA44,6,57,0,0
 1895 FORZ=1TO36:READI(Z):NEXT
 1900 DATA3,9,7,0,0,21,0,36,0,24,0,0,0,33,0,0,0,42,44,0,46,0,49,48,50,53,0
 1910 DATA16,16,0,0,1,0,1,1,47
 1920 FORZ=1TO36:READW%(Z):NEXT
 1930 DATA6,25,9,0,0,0,0,50,20,10,8,12,11,60,0,0,0,3,30,1,0,0,0,20,0,0,0
 1935 DATA10,9,0,15,0,0,0,0,3
 1950 FORZ=1TO12:READIM$(Z):NEXT
 1960 DATAFROM,TO,IN,THRO,UNDE,OVER,ARO,AT,ON,THE,AN,A
 1970 GOSUB20000:RETURN
 2000 GOTO2000+Z*10
 2010 PRINT"The weights have made you too heavy   for the stairs!
 2015 PRINT"AAAAAAaaaaaaahh. crunch!":S=S+10:EXPLODE:WAIT10:SHOOT:RETURN
 2020 PRINT"The carpet is too heavy to lift, but  you have pulled it to one side"
 2025 S=S+10:RETURN
 2030 PRINT"The bolts twist off and there is a    dull thud from below":S=S+10
 2033 GOSUB7700:RETURN
 2040 PRINT"There is no trapdoor here I'm afraid.":RETURN
 2050 PRINT"You cannot use this 'trapdoor' in any   way":RETURN
 2060 PRINT"The trees cannot be climbed":RETURN
 2070 PRINT"The witch takes the frog, stirs it    into her foul soup and gives you
 2072 F(3)=1
 2075 PRINT"a phial of blue liquid":S=S+10:RETURN
 2080 PRINT"The liquid is poisenous....":RETURN
 2090 PRINT"The tadpole is not cooked!":RETURN
 2100 ZAP:PRINT"There is a zap as the machinery altersthe molecular structure of
 2104 PRINT"the creature you were holding":S=S+10:RETURN
 2110 PRINT"You don't have gills! You are having a slight problem in this place
 2114 RETURN
 2120 PRINT"Come on, surely you have better things to do!":RETURN
 2130 PRINT"Grrrrr Arrrgh growwwwl":RETURN
 2140 PRINT"The box contains garlic!":RETURN
 2150 PRINT"There is a sound... Knock Knock":GOSUB7800:RETURN
 2160 PRINT"There is a sound.. Ding Dong":GOSUB7900:RETURN
 2170 PRINT"Oh dear, you have just walked CLOADut to  where there is a lack of floor
 2175 RETURN
 2180 PRINT"Oh dear, the ledge is just a bit too  narrow to stand on":RETURN
 2190 PRINT"There is a note on the wall: Safe     removed during redecoration"
 2194 RETURN
 2200 PRINT"Burp":RETURN
 2210 PRINT"That's funny, everything has gone a   bit larger":S=S+10:RETURN
 2220 PRINT"That's funny, I can see things much   more clearly":S=S+10:RETURN
 2230 PRINT"The  witch creates an aura around     herself for protection":RETURN
 2240 IFD1THEN2248
 2242 PRINT"The nasty vampire won't let you!":D1=TRUE:RETURN
 2248 PRINT"Dracula gets fed up with this and...":R=57:RETURN
 2250 IFD2THEN2258
 2253 PRINT"The werewolf snarls, stopping your     passage":D2=TRUE:RETURN
 2258 PRINT"T0e werewolf springs...":R=57:RETURN
 2260 IFD3THEN2268
 2262 PRINT"The mummy stops your progress":D3=TRUE:RETURN
 2268 PRINT"The mummy comes towards your saying   KARIC WANT TANA":R=57:RETURN
 2270 PRINT"Grabbing your Tana Leaves, the mummy  departs happily":S=S+10:RETURN
 2280 PRINT"The werewolf is frightened by your    mask and runs off":S=S+10:RETURN
 2290 PRINT"The vampire walks off with fingers    holding his nose":S=S+10:RETURN
 2300 PRINT"The wall spins round.. dizzily you    emerge.":RETURN
 2310 PRINT"The wall does not budge":RETURN
 2320 PRINT"Please say which wall; like PUSH EAST or something":RETURN
 2330 PRINT"You have no key":RETURN
 2340 PRINT"The key turns, the door is pulled backand a torrent of water floods out
 2341 GOSUB7500
 2344 S=S+10:RETURN
 2350 PRINT"Unfortunately you cannot breath under water":RETURN
 2360 PRINT"The safe needs a combination. What is it?";:RETURN
 2370 PRINT"You seem to be playing a different ad-venture game!":RETURN
 2380 PRINT"In your haste to descend, you seem to have tripped over a hole.":RETURN
 2390 PRINT"Wheee!":GOSUB7600:RETURN
 2400 PRINT"You can't defy gravity":RETURN
 2410 PRINT"The stairs facilitate vertical trans- portation":RETURN
 2420 PRINT"The carpet is old and heavy":RETURN
 2430 PRINT"The weights are very heavy":RETURN
 2440 PRINT"The bike is fixed to the ground, and  is strange in that it has a 
 2444 PRINT"mileometer that doesn't change":RETURN
 2450 PRINT"The mileometer reads:";
 2452 IFSC>0THEN2456
 2453 S=S+10
 2455 SC=INT(RND(9)*100000)
 2456 PRINTSC:RETURN
 2460 IFLEFT$(I$,7)="LOOK UN"THENPRINT"There is only dust there":RETURN
 2465 PRINT"The mattress is quite large, robust,  dirty and springy":RETURN 
 2470 PRINT"There is an ugly face staring back":RETURN
 2480 PRINT"There's an odd looking room in it":RETURN
 2490 PRINT"The doors are all unlocked":RETURN
 2500 PRINT"The painting looks valuable":RETURN
 2510 PRINT"The window is stuck open":RETURN
 2520 PRINT"The trees are tall, but unclimbable":RETURN
 2530 PRINT"The tank is full of water":RETURN
 2540 PRINT"The chandelier is very pretty":RETURN
 2550 PRINT"The room is very dark":RETURN
 2560 PRINT"The witch is of the evil variety":RETURN
 2570 PRINT"The cauldron is large and totally un- interesting":RETURN
 2580 PRINT"The leaves are of the Tana variety":RETURN
 2590 PRINT"The mask is frightening!":RETURN
 2600 PRINT"This scuba stuff is just about your   size":RETURN
 2610 PRINT"The garlic is like ... Garlic!":RETURN
 2620 PRINT"The walls are solid":RETURN
 2630 PRINT"The walls don't appear to be quite    solid":RETURN
 2640 PRINT"The gate is huge, occupying almost a  complete wall":RETURN
 2650 PRINT"The key is quite chunky, and is very  rusty":RETURN
 2660 PRINT"The Golden sceptre looks quite        valuable":RETURN
 2670 PRINT"The mummy is tall, and unfriendly":RETURN
 2680 PRINT"The vampire has a strong resemblance  to Vincent Price":RETURN
 2690 PRINT"The werewolf is large, furry but not  in the least cute":RETURN
 2700 PRINT"The chue descends into darkness":RETURN
 2710 PRINT"The safe has a combination lock":RETURN
 2720 PRINT"The door doesn't admit impolite people":RETURN
 2730 PRINT"There is a click, as absolutely       nothing happens"
 2733 GOSUB7950:RETURN
 2740 PRINT"The frog turns into a handsome prince.Seeing you, he says 'eeuurgh!'
 2744 PRINT"and departs hurriedly":RETURN
 2750 PRINT"It's too high, and you can't reach":RETURN
 2760 PRINT"That's difficult from within a Scuba  outfit!":RETURN
 2770 PRINT"Rule 1 when gardening - Find a garden":RETURN
 2780 PRINT"ok":RETURN
 2790 PRINT"As I said, the carpet is too heavy":RETURN
 2800 PRINT"The bolts won't turn any more":RETURN
 2810 PRINT"The bike is fixed so that it doesn't  actually move":RETURN
 2820 PRINT"Phew!":RETURN
 2830 PRINT"The mirror is unbreakable; lucky in   view of the next seven years"
 2833 RETURN
 2840 PRINT"Find it yourself":RETURN
 2850 PRINT"You need a key":RETURN
 2860 PRINT"Hey, this stuff has burnt away the    floor!":RETURN
 2870 PRINT"You're falling through it":RETURN
 2880 PRINT"Darkness closes in.. there is a       hollow laugh...":RETURN
 2890 PRINT"... Darkness closes in .. and suddenly":RETURN
 3000 GOTOZ*10+3000-5*IN
 3010 PRINT"There are some odd leaves here":RETURN
 3015 PRINT"Odd leaves":RETURN
 3020 PRINT"A scuba diving outfit lies here":RETURN
 3025 PRINT"Scuba diving gear":RETURN
 3030 PRINT"Lying on the ground is ";
 3035 PRINT"werewolf mask":RETURN
 3040 REM
 3045 PRINT"There is now a dangerous hole in the  stairs.":RETURN
 3050 PRINT"The tank is now empty of water":RETURN
 3060 PRINT"High above there is a chandelier":RETURN
 3070 PRINT"There are bits of smashed chandelier  everywhere!":RETURN
 3080 PRINT"Nearby you can see a ";
 3085 PRINT"mattress":RETURN
 3090 PRINT"Lying delicately at your feet is an "
 3095 PRINT"expensive chandelier":RETURN
 3100 PRINT"There is a tadpole here":RETURN
 3105 PRINT"tadpole":RETURN
 3110 PRINT"There is a phial of blue liquid nearby":RETURN
 3115 PRINT"Phial of liquid":RETURN
 3120 PRINT"croaking here is a ";
 3125 PRINT"frog":RETURN
 3130 PRINT"You can see some ";
 3135 PRINT"garlic":RETURN
 3140 PRINT"Some idiot has left some weights to   fall over":RETURN
 3145 PRINT"weights":RETURN
 3150 PRINT"The heavy carpet has been pushed asideto reveal what might be a trap-
 3153 PRINT"door.  Four bolts are here in a square":RETURN
 3160 PRINT"The heavy carpet has been shoved asideand something that looked like
 3163 PRINT"a trapdoor but isn't lies here":RETURN
 3170 PRINT"The mirror now seems to have lost its mirroring properties":RETURN
 3180 PRINT"Dropped here is a ";
 3185 PRINT"big rusty key":RETURN
 3190 PRINT"In this place lies a Renoir of great  value":RETURN
 3195 PRINT"portrait":RETURN
 3200 PRINT"There is a note here :-
 3205 PRINT:PRINT:PRINT"Sorry, safe removed during alterations":RETURN
 3210 PRINT"The huge door is closed":RETURN
 3220 PRINT"The door is now open":RETURN
 3230 PRINT"There is a mummy here!!":RETURN
 3240 PRINT"There is a golden sceptre here!":RETURN
 3245 PRINT"Golden Sceptre":RETURN
 3250 PRINT"Count Dracula stands here":RETURN
 3260 PRINT"There is nasty looking werewolf care- fully watching you!":RETURN
 3270 PRINT"The floor here is slightly eroded by  acid":RETURN
 3280 PRINT"Lying appetisingly nearby is a"
 3285 PRINT"cake iced with 'EAT-ME'":RETURN
 3290 PRINT"There is a bun labelled 'EM-TAE'      here":RETURN
 3295 PRINT"EM-TAE bun":RETURN
 3300 PRINT"There is a note on the wall:
 3305 PRINT"Somewhere over the rainbow..":RETURN
 3310 PRINT"The great Crystal of Orc is here!":RETURN
 3315 PRINT"Crystal of Orc":RETURN
 3320 PRINT"There is a closed door in front of you":RETURN
 3330 PRINT"The front door is open":RETURN
 3340 PRINT"There is a brass door knocker here":RETURN
 3350 PRINT"There is a bell push here":RETURN
 3360 PRINT"There is a silver bracelet here":RETURN
 3365 PRINT"bracelet":RETURN
 3370 PRINT"The safe is now open":RETURN
 4000 PRINT:PRINT:GOTOZ*10+4000:PRINT:PRINT
 4010 PRINT"You are outside a tall gloomy buildingThere is a door here, to the North
 4012 PRINT:PRINT"There are trees all around"
 4014 RETURN
 4020 PRINT"You are in a dark forest, full of tall and rather strange trees
 4022 RETURN
 4030 PRINT"You are in a dark forest. It is early autumn.":RETURN
 4040 PRINT"You are in a dark forest, tall trees  are all around":RETURN
 4060 PRINT"You are inside the building. Although quite dingy, this place is";
 4062 PRINT" certainly":PRINT"impressive":PRINT
 4066 PRINT"Passages go east-west past the exit   in the south. Crumbling wooden
 4068 PRINT"stairs climb to the next floor":RETURN
 4070 PRINT"You are in a make-up room, and there  are various uninteresting things
 4077 PRINT"around.":RETURN
 4080 IFPR=1THEN4084
 4082 PRINT"You are in a props room, and a mad    axe man is here!":PR=1
 4083 RETURN
 4084 PRINT"The axeman comes towards you..."
 4085 PRINT:R=57:POP:GOTOO 
 4090 PRINT"You're in the costumes room. None of  the lavish costumes remain"
 4095 RETURN
 4110 PRINT"You're in a corridor that goes North  and East.  Rooms are to the South
 4114 PRINT"and West. ":IFG8=0THENG8=1:PRINT"Loud screams are coming":PRINT"from the West."
 4118 RETURN
 4120 PRINT"You're in a north to south corridor   which has a doorway on the West
 4122 RETURN
 4130 PRINT"You're in a corridor that twists east and south. There is a doorway 
 4133 PRINT"to the north":RETURN
 4140 PRINT"You're in a corridor that goes         east/west":RETURN
 4150 PRINT"You're in a corridor that twists west and south. There is a door on the
 4155 PRINT"east side":RETURN
 4160 PRINT"You are in a kitchen, where a witch is stirring a strange mixture in
 4165 PRINT"a large cauldron. (The mixture is in  the cauldron, not the witch)
 4168 RETURN
 4170 PRINT"You are in a north-south corridor.    East of here lies a room labelled
 4175 PRINTCHR$(129);" Developing Room"
 4177 PRINT:RETURN
 4180 PRINT"You are in a darkish room, illuminatedonly by a red glowing button
 4183 RETURN
 4190 PRINT"You're in a passage that goes around  the corner, North and West. There
 4194 PRINT"is a doorway on the East.":RETURN
 4200 PRINT"You are on the north section of a set which has been created as a ball-
 4203 PRINT"room, stretching out to the south.    There is an western exit"
 4205 RETURN
 4210 PRINT"You're in the centre of a grand        ballroom.":RETURN
 4220 PRINT"You're on the south side of the ball- room set. There is a doorway
 4223 PRINT"south of here.":RETURN
 4230 PRINT"You are on another set, next to a tank of water, perhaps left there
 4233 PRINT"for some boating scene. The exit lies  to the north":RETURN
 4240 PRINT"You're in a tank of water. CHARause thewater is so dirty it is hard to 
 4244 PRINT"discern any details. The only exit is out!":RETURN
 4250 PRINT"You are now halfway up these somewhat rickety stairs. The wood
 4255 PRINT"is particularly rotten at this point":RETURN
 4260 PRINT"You are in the back yard. A southern  doorway leads back into the buil-
 4265 PRINT"ding and a shed lies nearby":RETURN
 4270 PRINT"You are in a small shed. There is a   large cardboard box here on the
 4275 PRINT"ground.":RETURN
 4280 PRINT"You are on the landing above the      stairs. A passage goes east-west
 4287 PRINT"and there is a door to the north.":RETURN
 4290 PRINT"You're in a corridor. Directions are  north and west":RETURN
 4300 PRINT"You are in a passage that goes north  around a corner, south around a
 4303 PRINT"different corner or east into another corridor":RETURN
 4310 PRINT"You are in a corridor outside a room  north and a room to the east
 4314 PRINT"A westerly passage leads back out":RETURN
 4320 PRINT"You're in a dusty bedroom. A heavy    carpet lies on the floor":RETURN
 4330 PRINT"You're in a keep-fit room. An exercisebike is fixed to the floor
 4333 RETURN
 4340 PRINT"You're in a corridor that goes East   and  south":RETURN
 4350 PRINT"You're in a corner. Corridors go east and north. A stairway goes up"
 4355 RETURN
 4360 PRINT"You're in an old bedroom":RETURN
 4370 PRINT"You're above the stairway in the southside of the attic":RETURN
 4380 PRINT"You're in a north section of the atticA large mirror is on the
 4384 PRINT"east side.":RETURN
 4390 PRINT"You're in an odd room. There are the  following:
 4393 PRINT"A red door in the north wall,a yellow door in the east wall, and a
 4396 PRINT"blue door to the south. An exit lies  west":RETURN
 4400 PRINT"You are in another odd room, which hasa blue door north, a white door
 4404 PRINT"south and a purple door east":RETURN
 4410 PRINT"You're outside the building on a        narrow ledge which starts
 4412 PRINT"here and goes east":RETURN
 4420 PRINT"You are in an odd room. There is a    black door to the north, a brown
 4422 PRINT"door to the south and a yellow door tothe west":RETURN
 4430 PRINT"You're in an odd room. A brown door   lies north and a red door goes 
 4433 PRINT"west ":RETURN
 4440 PRINT"You're in a small room which has a    glassless window leading out to
 4444 PRINT"a narrow ledge":RETURN
 4450 PRINT"You have fallen into a room with no   apparent exits.  Howevar, the 
 4454 PRINT"walls don't look entirely solid...?":RETURN
 4460 PRINT"You are outside a large door. The onlyexits are west back to the
 4464 PRINT"exitless room and east through the    door":RETURN
 4470 PRINT"You are in a high walled room which is quite damp in places. West is a
 4477 PRINT"large door, and a passage takes you   north":RETURN
 4480 PRINT"You are in a small room with the odd  bandage here and there.":RETURN
 4490 PRINT"You are in a small room. A passage    goes south and the exit lies
 4495 PRINT"north.":RETURN
 4500 PRINT"You're in the crypt. There are pass-  ages going east and west":RETURN
 4510 PRINT"You are in a passage that travels     north or south.
 4515 PRINT"A small avenue goes east":RETURN
 4520 PRINT"You are in an east/west alley":RETURN
 4530 PRINT"You're in a large hairy room, where   there is only a passage going west
 4533 PRINT"There is a chute on the east wall":RETURN
 4540 RR=-1:CW=CW+1:ONCWGOTO4542,4544,4545,4548
 4541 PRINT"Crunch...":R=57:RETURN
 4542 PRINT"You're in a large room with no exits. A button marked 'PANIC' is here"
 4543 PRINT"The walls don't budge either!":RETURN
 4544 PRINT"You're in a large room.. hang on it   seems smaller?":RETURN
 4545 PRINT"You're in a small room, the walls are closing in rapidly oh-oh":RETURN
 4548 PRINT"Help! The walls are now pressing      against you":RETURN
 4550 PRINT"You are in a room which is being re-  decorated. A number has been
 4555 PRINT"written on the wall:";
 4556 IFFR=0THENFR=INT(RND(9)*9000)
 4557 PRINTFR:PRINT"There is a safe imbedded in one wall"
 4558 PRINT:PRINT"The message 'somewhere over the rain- bow (There's no place like..)
 4559 PRINT"has been written on the wall":RETURN
 4560 PRINT"You are at the eastern extreme of the narrow ledge. A glassless
 4566 PRINT"window is in front of me":RETURN
 4570 FORZ=1TO100:EXPLODE:WAIT3:NEXT:RETURN
 5000 REM COMMANDS
 5002 GOTO40000+R*100
 5010 REM
 5014 IFV<>8THEN6000
 5020 REM EXAMS
 5030 IFN=45AND(R=6ORR=25ORR=35ORR=28ORR=37)THENZ=41:GOSUB2000:GOTOO
 5040 IFN=22ANDR=32THENZ=42:GOSUB2000:GOTOO
 5050 IFN=19AND(I(14)=-1ORI(14)=R)THENZ=43:GOSUB2000:GOTOO
 5060 IFN=47ANDR=33THENZ=44:GOSUB2000:GOTOO
 5070 IFN=48ANDR=33THENZ=45:GOSUB2000:GOTOO
 5080 IFN=13AND(I(8)=-1ORI(8)=R)THENZ=46:GOSUB2000:GOTOO
 5090 IFN=23ANDR=38ANDI(17)=0THENZ=47:GOSUB2000:GOTOO
 5100 IFN=23ANDR=38THENZ=48:GOSUB2000:GOTOO
 5105 IFN$="BOX"ANDR=27THENPRINT"The box is heavy, but can be opened":GOTOO
 5110 IFN=27AND(R=39ORR=40ORR=42ORR=43)THENZ=49:GOSUB2000:GOTOO
 5120 PRINT:PRINT
 5130 IFN=49AND(R=56ORR=44)THENZ=51:GOSUB2000:GOTOO
 5140 IFN$="TREE"AND(R=2ORR=3ORR=4)THENZ=52:GOSUB2000:GOTOO
 5150 IFN=11ANDR=23THENZ=53:GOSUB2000:GOTOO
 5160 IFN=12AND(I(9)=-1ORI(9)=RORI(6)=R)THENZ=54:GOSUB2000:GOTOO
 5170 IFN=50ANDR=18THENZ=55:GOSUB2000:GOTOO
 5180 IFN=51ANDR=16THENZ=56:GOSUB2000:GOTOO
 5190 IFN=52ANDR=16THENZ=57:GOSUB2000:GOTOO
 5200 IFN=7AND(I(1)=-1ORI(1)=R)THENZ=58:GOSUB2000:GOTOO
 5210 IFN=42AND(I(3)=-1ORI(3)=R)THENZ=59:GOSUB2000:GOTOO
 5220 IFN=8AND(I(2)=-1ORI(2)=R)THENZ=60:GOSUB2000:GOTOO
 5230 IFN=18AND(I(13)=-1ORI(13)=R)THENZ=61:GOSUB2000:GOTOO
 5240 IFN=43ANDR=45THENZ=63:GOSUB2000:GOTOO
 5250 IFN=43THENZ=62:GOSUB2000:GOTOO
 5260 IFN=53ANDR=46THENZ=64:GOSUB2000:GOTOO
 5270 IFN=24AND(I(18)=-1ORI(18)=R)THENZ=65:GOSUB2000:GOTOO
 5280 IFN=29AND(I(24)=-1ORI(24)=R)THENZ=66:GOSUB2000:GOTOO
 5290 IFN=28ANDI(23)=RTHENZ=67:GOSUB2000:GOTOO
 5300 IFN=30ANDI(25)=RTHENZ=68:GOSUB2000:GOTOO
 5310 IFN=31ANDI(26)=RTHENZ=69:GOSUB2000:GOTOO
 5320 IFN=56ANDR=54THENZ=70:GOSUB2000:GOTOO
 5330 IFN=26ANDR=55THENZ=71:GOSUB2000:GOTOO
 5340 IFN=27ANDR=1ANDI(32)=RTHENZ=72:GOSUB2000:GOTOO
 5400 RR=-1:GOTOO
 6000 IFV$="KISS"ANDN$="FROG"THENPRINT"This isn't a fairy tale you know":GOTOO
 6005 IFV=4ANDN=27AND(R=39ORR=40ORR=42OR4=43)THENPRINT"The door is open":GOTOO
 6010 IFV=19THENZ=77:GOSUB2000:GOTOO
 6020 IF(V$="USE"ORV$="LIFT")ANDN$="WEIGHTS"THENZ=82:GOSUB2000:GOTOO
 6030 IFV=1ANDN=14AND(I(8)=RORI(8)=-1)THENZ=12:GOSUB2000:GOTOO
 6040 IFV=1ANDN=13AND(I(8)=RORI(8)=-1)THENZ=12:GOSUB2000:GOTOO
 6050 IFV=12AND(I(8)=-1ORI(8)=R)THENZ=12:GOSUB2000:GOTOO
 6060 IFV=6ANDN=33AND(I(28)=-1ORI(28)=R)THENZ=21:GOSUB2000:F(2)=1:I(28)=0:GOTOO
 6070 IFV=6ANDN=34AND(I(29)=-1ORI(29)=R)THENZ=22:GOSUB2000:GOTO6075
 6072 GOTO6080
 6075 I(17)=38:I(29)=0:GOTOO
 6080 IFV=16ANDN=43THENZ=31:GOSUB2000:GOTOO
 6090 IFV=16ANDN<8THENZ=31:GOSUB2000:GOTOO
 6100 IFV=26THENZ=84:GOSUB2000:GOTOO
 6110 IF(V=3ORV=14ORV=17)ANDN=16AND(I(11)=-1ORI(11)=R)THEN6116
 6112 GOTO6120
 6116 IFR=24THENI(11)=47:GOTOO
 6117 I(11)=0:I(27)=R:Z=86:GOSUB2000:GOTOO
 6120 IFV=6ANDN=16AND(I(11)=-1ORI(11)=R)THENZ=8:GOSUB2000:R=57:GOTOO
 6130 IFV=6ANDN=15THENZ=9:GOSUB2000:GOTOO
 6140 IFV=2ANDN$="CROSS"THENPRINT"Why, what's upset you?":GOTOO
 6150 IFV=28THENZ=37:GOSUB2000:GOTOO
 6160 IFV=29THENPRINT"I'm as worried as you are":GOTOO
 6170 IFV$="WEAR"THENPRINT"If you have got it, I'll assume you'rewearing it":GOTOO
 6300 GOTO635
 6500 REM
 6502 X=INT(RND(9)*12)+1:Y=INT(RND(9)*3)+2:FORI=1TOZ:PLAY3,0,MM,MN
 6504 FORI=1TOZ
 6505 IFY<0THENY=0ELSEIFY>6THENY=6
 6510 MUSIC1,Y,X,3:PLAY1,0,0,0:WAIT16*INT(RND(9)*4+1)
 6511 PLAY0,0,0,0:WAIT2*INT(RND(9)*3+1)
 6520 X=X+INT(RND(9)*9)-3:IFX<1THENX=X+12:Y=Y-1ELSEIFX>12THENX=X-12:Y=Y+1
 6530 NEXT
 6540 PLAY0,0,0,0:RETURN
 6800 CLS:PAPER0:INK3:PRINT:PRINT"If you get stuck, try examining things";
 6810 PRINT"and using items in different ways
 6820 PRINT"There are five treasures hidden, and  unlike most adventure games,
 6830 PRINT"you will have to solve many problems  to find anything of value
 6840 PRINT:PRINT"Your score depends on other factors   than treasures located and
 6850 PRINT"it is possible to get a score of 50%  without finding anything of
 6860 PRINT"value, in which case treasures will be nearby.":PRINT:PRINT:PRINT
 6865 PRINT"Treasures should be deposited
 6870 PRINT"outside the main entrance in safety,  but if you leave valuables around
 6880 PRINT"elsewhere, then watch that they are   not nicked!"
 6890 PRINT"I wouldn't hang around after midnight!   Good luck!"
 6895 REPEAT:UNTILKEY$<>""
 6900 RETURN
 7000 SOUND4,4,3:PLAY0,1,0,0
 7010 RETURN
 7500 FORI=15TO4STEP-.51:FORJ=31TO20STEP-.5 
 7505 SOUND1,J,I:PLAY0,1,0,0
 7520 NEXT:NEXT:WAIT40:PLAY0,0,0,0:RETURN
 7600 FORI=10TO90:SOUND1,I,1:SOUND2,I*2,1:PLAY3,0,0,0:NEXT:PLAY0,0,0,0:RETURN
 7700 SOUND4,10,3:PLAY0,1,0,0:WAIT7:SOUND4,14,1:PLAY0,1,0,0:WAIT20
 7710 PLAY0,0,0,0:RETURN
 7800 FORI=1TO2:SOUND4,11,0:PLAY0,1,1,60:WAIT60:NEXT:PLAY0,0,0,0
 7810 RETURN
 7900 MUSIC1,5,9,1:PLAY1,0,0,0:WAIT89:MUSIC1,5,5,1
 7910 WAIT80:PLAY0,0,0,0:RETURN
 7920 RETURN
 7950 SOUND4,10,0:PLAY0,1,1,300:RETURN
 8000 REM ERRORS
 8005 IFV$="UNWR"ANDN$="MUMM"THEN8007
 8006 GOTO8010
 8007 PRINT"The mummy decides to stay gift-wrappedand fends off your strange attack
 8008 GOTOO
 8010 IFN<8ANDV<>1ANDN>0THENPRINT"Try GO ";N$:GOTOO
 8015 IFV$="JUMP"THENPRINT"boing boing boing!":GOTOO
 8017 IFV$<>"SAY"THEN8020
 8018 IFLEN(I$)>4THENPRINTMID$(I$,5):GOTOO
 8020 IFV=1THENPRINT"Which direction do you want?":GOTOO
 8025 IFV$="HELL"THENPRINT"Hello":GOTOO
 8030 IFV=4THENPRINT"You cannot open it":GOTOO
 8035 IFV=5ANDN=27ANDR=46ANDI(21)=RTHENPRINT"It's locked anyway!":GOTOO
 8040 IFV=5ANDN$="DOOR"AND(R=6ORR=39ORR=40ORR=42ORR=43ORR=46)THEN8045
 8042 GOTO8050
 8045 PRINT"Ok, it's closed, but it won't lock":GOTOO 
 8050 IFV=5THENPRINT"That's not possible":GOTOO
 8060 IFV=6THENPRINT"I don't think that it would go down   well!":GOTOO
 8070 IFV=7ANDI(23)=RTHENPRINT"Oh no! His arms start to throttle you..":GOTOO
 8080 IFV=7ANDI(25)=RTHENPRINT"He fends off your blows easily":GOTOO
 8090 IFV=7ANDI(26)=RTHENPRINT"The creature repels your attack":GOTOO
 8100 IFV=7ANDR=8THENPRINT"The crazed attacker strikes.. chop    chop chop":GOTOO
 8105 IFV=7THENPRINT"What are you trying to attack?":GOTOO
 8110 IFV=9THENPRINT"Sorry, you cannot make that sort of   thing":GOTOO
 8120 IFV=11THENPRINT"Please say in more detail what you    want":GOTOO
 8130 IFV=12THENPRINT"It wouldn't be very comfortable":GOTOO
 8140 IFV=14THENPRINT"The items in this game are still underwarranty!":GOTOO
 8150 IFV=15THENPRINT"What are you trying to ruin?":GOTOO
 8160 IFV=16THENPRINT"Nothing happens as a result!":GOTOO
 8170 IFV=18THENPRINT"Boo to you too!":GOTOO
 8180 IFV=20THENPRINT"You haven't wings":GOTOO
 8190 IFV=22THENPRINT"Knock knock":GOTOO
 8200 IFV=23THENPRINT"ding dong":GOTOO
 8210 IFV=24THENPRINT"Can't you walk like everyone else?":GOTOO
 8220 IFV=27THENPRINT"there's no place like it!":GOTOO
 8230 IFN=0THENPRINT"Sorry, that doesn't make sense":GOTOO
 8250 PRINT"What do you want to do?":GOTOO
 8500 REM MONSTER MOVES
 8510 IFTH>17THENRETURN
 8520 IFI(23)=0THEN8600
 8530 IFRND(9)>.2THEN8600
 8540 I(23)=INT(RND(9)*56)+1:RR=-1:RETURN
 8600 IFI(25)=0THEN8700
 8610 IFRND(9)<.8THEN8700
 8620 I(25)=INT(RND(9)*56)+1:RR=-1:RETURN
 8700 IFI(26)=0THENRETURN
 8710 IFRND(9)<.8THENRETURN
 8720 I(26)=INT(RND(9)*56)+1:RR=-1:RETURN
 9000 REM TRANSLATE I$
 9010 IFI$="N"THENI$="GO NORTH":RETURN
 9020 IFI$="S"THENI$="GO SOUTH":RETURN
 9030 IFI$="E"THENI$="GO EAST":RETURN
 9040 IFI$="W"THENI$="GO WEST":RETURN
 9050 IFI$="U"THENI$="GO UP":RETURN
 9060 IFI$="D"THENI$="GO DOWN":RETURN 
 9070 IFI$="I"ORLEFT$(I$,4)="INVE"THENI$="TAKE INVE":RETURN
 9090 IFI$="Q"THENI$="QUIT"
 9100 RETURN
 9200 HIRES
 20000 REMDATASAVING
 20001 TEXT
 20005 A=#B800:READD$
 20010 FORI=1TOLEN(D$)STEP2
 20020 V=VAL("#"+MID$(D$,I,2)):POKEA,V:A=A+1:NEXT
 20030 READD$:IFD$<>"Z"THEN20010
 20040 DOKE#400,#0A4C:DOKE#402,#4CB8:DOKE#404,#B858:RETURN
 20050 DATA55555555233944363855200BB90820D6B820BAE6A92520C6E5A53320C6E5A53420
 20060 DATAC6E520EEB820A7E5242810032035B82004E82860A000B101F017AAA002B10199D0
 20070 DATA0088D0F8E8CAF008B1D120C6E5C8D0F520C3B890DE602095D5200BB90820D6B820
 20080 DATA96E62030E6C925D0F92030E685332030E68534A002B1CEC533C8B1CEE534B00620
 20090 DATA04E84C83C420EEB820EBE424281003209BB82004E82860A000B101F01C20F0D4AA
 20100 DATAE8A000CAF0082030E691D1C8D0F5A002B9D000910188D0F820C3B890D96018A903
 20110 DATA65018501A89002E602A502C461E5626020CAE62018B9A003B1CEAA88B1CEE901B0
 20120 DATA01CA853386346018A5CE65338561A5CF65348562A004B1CE20F6D1855F84608501
 20130 DATA84026020E800C92CF0034CE4CF4CE200A20020E800862785B420E8002086D1B006
 20140 DATA2004E84CE4CFA2008628862920E20090052086D1900BAA20E20090FB2086D1B0F6
 20150 DATAC924D006A9FF8528D00CC925D00FA980852905B485B48A0980AA20E20086B5A69E
 20160 DATAA59F86CE85CFC5A1D004E4A0F01FA000B1CEC8C5B4D006A5B5D1CEF00EC8B1CE18
 20170 DATA65CEAAC8B1CE65CF90D738602004E8A22A4C85C455,Z
 30000 REM SCORE
 30010 S1=0:Z$="0919243136":FORX=1TOLEN(Z$)/2:Z=VAL(MID$(Z$,(X-1)*2+1,2))
 30020 IFI(Z)=-1ORI(Z)=1THENS1=S1+20
 30030 NEXT:Z=INT((S1+S)/220*100+.5):IFZ>100THENZ=100
 30040 PRINT:PRINT"Your score is "Z"%"
 30045 IFZ=100THENGOSUB50000:GOTO31200
 30046 IFZ>45ANDZ<60THENPRINT"Come on! you're only half finished!"
 30050 PRINT:PRINT:RETURN
 30100 REM INVE
 30110 I8=TRUE::IN=TRUE:FORZ=1TO36:IFI(Z)<>-1THEN30150
 30120 IFI8THENI8=FALSE:PRINT"You have:"
 30130 I9=FALSE:GOSUB3000
 30150 NEXT:IN=FALSE
 30160 IFI8THENPRINT"you have nothing at all!"
 30170 RETURN
 30200 REM PICKUP/DROP ITEM
 30205 F=0:FORZ=1TO36
 30210 IFG%(Z)<>NTHEN30280
 30220 IFV<>2THEN30260 
 30230 IFI(Z)<>RTHEN30280
 30240 GOSUB30300:IFITHENPRINT"You cannot carry any more":RETURN
 30245 IFZ=9ORZ=19ORZ=24ORZ=31ORZ=36THENK=Z:Z=5:GOSUB6500:Z=K
 30250 I(Z)=-1:PRINT"Ok you've got the":IN=-1:GOSUB3000:IN=0:F=1:GOTO30280
 30260 IFI(Z)<>-1THEN30280
 30270 I(Z)=R:PRINT"Ok you've dropped the":IN=-1:GOSUB3000:IN=0:F=1
 30280 NEXT
 30285 IFF=1THENRETURN
 30290 IFV=2THENPRINT"You aren't capable of that":RETURN
 30295 PRINT"You don't have it!":RETURN
 30300 I=0:T=0:FORY=1TO35:IFI(Y)=-1THENT=T+W%(Y)
 30310 NEXT:T=T+W%(Z):IFT>80THENI=-1
 30330 RETURN
 30600 IFR>1ANDR<5THENN=INT(RND(9)*4)+1
 30605 FORZ=0TO14STEP2:IFGT%(R,Z)=0THEN30690
 30610 IFGT%(R,Z)=NTHEN30660
 30620 NEXT:GOTO30690
 30660 R=GT%(R,Z+1):RETURN
 30690 IFRND(9)<.3THENPRINT"That isn't a possible direction":RETURN
 30692 IFRND(9)<.3THENPRINT"You cannot go that way":RETURN
 30694 PRINT"That isn't a possible route":RETURN
 30700 REM SAVE
 30710 PRINT"Please press a key to begin recording":GETZ$
 30715 JU(1)=R:JU(2)=S:JU(3)=FR:JU(4)=SC:JU(5)=TH:JU(6)=TM
 30720 POKE#67,0:CALL1024,JU
 30730 CALL1024,F
 30740 CALL1024,I
 30760 PRINT"FINISHED!":RETURN
 30800 REM LOAD
 30810 PRINT"Please load the data file"
 30820 POKE#67,0:CALL1027,JU
 30830 CALL1027,F
 30840 CALL1027,I
 30850 R=JU(1):S=JU(2):FR=JU(3):SC=JU(4):TH=JU(5):TM=JU(6)
 30860 RETURN
 31000 PRINT:PRINT:ONINT(RND(9)*6+1)GOTO31010,31020,31030,31040,31050,31060
 31010 PRINT"Your life is flashing before you..":GOTO31080
 31020 PRINT"You've 'ad it mate!":GOTO31080
 31030 PRINT"Oh dear now look what you've done!":GOTO31080
 31040 PRINT"oops that's torn it!":GOTO31080
 31050 PRINT"Aw what a shame!":GOTO31080
 31060 PRINT"You've mucked it up!"
 31080 PRINT:PRINT"You're dead! (Nothing personal you    understand)"
 31090 GOSUB30000
 31200 PRINT:PRINT:PRINT"That's the end of this game, but do   you dare to play again?"
 31205 Z=8:GOSUB6500
 31210 GETZ$:IFZ$="Y"THENRUN
 31220 IFZ$="M"THENPRINT"maybe what?":GOTO31210
 31230 IFZ$="N"THENEND
 31235 GOTO31210
 31400 REMFIND VERB/NOUN
 31410 FORZ=1TO77:IFV$(Z)<>V$THENNEXT:V=0:GOTO31450
 31420 V=V(Z)
 31450 FORZ=1TO77:IFN$(Z)<>N$THENNEXT:N=0:RETURN
 31460 N=N(Z):RETURN
 31500 Y=1:V$="":N$=""
 31510 GOSUB31600:IFZ$=""THEN31580
 31520 GOSUB31700:IFZ$=""THEN31510
 31530 V$=Z$
 31540 GOSUB31600:IFZ$=""THEN31580
 31550 GOSUB31700:IFZ$=""THEN31540
 31560 N$=Z$
 31580 RETURN
 31600 REM GET WORD
 31610 IFMID$(I$,Y,1)<>" "THEN31630
 31620 Y=Y+1:IFY<=LEN(I$)THEN31610
 31625 Z$="":RETURN
 31630 K=Y
 31640 Y=Y+1:IFY>LEN(I$) THEN 31660
 31650 IF MID$(I$,Y,1)<>" " THEN31640
 31660 Z$=MID$(I$,K,Y-K):RETURN
 31700 Z$=LEFT$(Z$,4)
 31705 FORZ=1TO12:IFZ$=IM$(Z)THENZ$=""
 31710 NEXT:RETURN
 39000 Z=TH:IFZ=0THENZ=12
 39010 IFZ>12THENZ=Z-12
 39011 I=15-(R-6):IFI>15ORI<1THENI=1
 39015 FORX=1TOZ
 39020 MUSIC1,2,11,I:MUSIC2,4,12,I:MUSIC3,3,9,I:PLAY7,0,0,0:WAIT25:PLAY0,0,0,0
 39030 WAIT70:NEXT:RETURN
 40100 IFV=4ANDN=27ANDI(32)=RTHENPRINT"The door does not oblige":GOTOO
 40102 IFV=1AND(N<1ORN>7)THENN=1:GOTO40100
 40105 IFV=1ANDN=1ANDI(32)=RTHENPRINT"The door is firmly shut":GOTOO
 40110 IFV=4ANDN=27ANDI(32)<>RTHENPRINT"The door is already open":GOTOO
 40120 IFV=22THENZ=16:GOSUB2000:I(33)=R:I(32)=0:GOTOO
 40130 IFV=23THENZ=15:GOSUB2000:I(33)=R:I(32)=0:GOTOO
 40140 IFV=11ANDN=39THENZ=16:GOSUB2000:I(33)=R:I(32)=0:GOTOO
 40150 IFV=11ANDN=40THENZ=15:GOSUB2000:I(33)=R:I(32)=0:GOTOO
 40160 IFV=16ANDN=40THENZ=15:GOSUB2000:I(33)=R:I(32)=0:GOTOO
 40162 IFI(33)=RTHEN40170
 40163 IFTH>18ANDTM>1THENPRINT"Have you announced your arrival?":GOTO5010
 40165 IFTH>18ANDI(32)=RTHENPRINT"Have you looked at the door?":GOTO5010
 40170 GOTO5010
 40200 IFV=1ANDN$="TREE"THENZ=6:GOSUB2000:GOTOO
 40210 GOTO5010
 40300 IFV=1ANDN$="TREE"THENZ=6:GOSUB2000:GOTOO
 40310 GOTO5010
 40400 IFV=1ANDN$="TREE"THENZ=6:GOSUB2000:GOTOO
 40410 GOTO5010
 40500 GOTO5010
 40600 IFV=24THENPRINT"You can't defy gravity!":GOTOO
 40620 GOTO5010
 40700 GOTO5010
 40800 GOTO5010
 40900 GOTO5010
 41000 GOTO5010
 41060 IFV=16ANDN=40THENZ=15:GOSUB2000:I(33)=R:I(32)=0:GOTOO
 41070 GOTO5010
 41100 GOTO5010
 41200 GOTO5010
 41300 GOTO5010
 41400 GOTO5010
 41500 GOTO5010
 41600 IFV=7ANDN=51THENZ=23:GOSUB2000:GOTOO
 41610 IFV=3ANDN=17ANDI(12)=-1THENI(12)=0:I(11)=-1:Z=7:GOSUB2000:GOTOO
 41615 IFV$="GIVE"ANDF(3)=1THEN5010
 41620 IFV$="GIVE"THENPRINT"Not the final ingredient, says the    witch":GOTOO
 41700 GOTO5010
 41800 IFV=16ANDN=46AND(I(10)=RORI(10)=-1)THENZ=10:GOSUB2000:GOTO41803
 41802 GOTO41810
 41803 I(10)=0:I(12)=R:ZAP:GOTOO
 41810 IFV=16ANDN=46AND(I(12)=RORI(12)=-1)THENZ=74:GOSUB2000:I(12)=0:GOTOO
 41820 IFV=16ANDN=46THENZ=73:GOSUB2000:GOTOO
 41900 GOTO5010
 42000 GOTO5010
 42100 IFV=2ANDN=12ANDI(6)=RTHENZ=75:GOSUB2000:GOTOO
 42110 IFV=2ANDN=12ANDI(7)=RTHENPRINT"There are too many bits!":GOTOO
 42200 GOTO5010
 42300 IFV=1AND(N=2ORN=11)ANDI(22)>0THEN42303
 42301 GOTO42305
 42303 PRINT"The water has gone, and you fall      rather heavily downwards"
 42304 R=47:GOTOO
 42305 REM
 42306 IFV=1ANDN=11ANDI(2)=-1THENR=24:GOTOO
 42310 IFV=1ANDN=11THENZ=11:GOSUB2000:R=57:GOTOO
 42320 GOTO5010
 42400 IFV=6ANDN=11THENZ=76:GOSUB2000:GOTOO
 42410 GOTO5010
 42500 IFV=24ANDN=44THENR=6:GOTOO 
 42505 IFV=1ANDN=10ANDI(4)=RTHENR=45:GOTOO
 42510 GOTO5010
 42600 GOTO5010
 42700 IFV=4ANDF(1)=0THENF(1)=1:PRINT"There's Garlic here!":I(13)=R:GOTOO
 42710 IFV=2ANDN$="BOX"THENPRINT"It's too heavy":GOTOO
 42720 IFV=4THENPRINT"You have done that already!":GOTOO
 42730 GOTO5010
 42800 IFV=1AND(N=6ORN=45)ANDI(4)<>0THENZ=38:GOSUB2000:R=57:GOTOO 
 42810 IFV=24ORN=44THENZ=39:GOSUB2000:R=6:GOTOO
 42820 GOTO5010
 42900 GOTO5010
 43000 GOTO5010
 43100 GOTO5010
 43200 IFV=2ANDN=22ANDI(15)<>RANDI(16)<>RTHENI(15)=R:Z=2:GOSUB2000:GOTOO
 43205 IFV=16ANDN=22THENV=2:GOTO43200
 43210 IFV=2ANDN=22ANDI(15)=RTHENZ=79:GOSUB2000:GOTOO
 43230 IFV=15ANDN=21ANDI(15)=RTHENI(15)=0:I(16)=R:GOTO43233
 43231 GOTO43240
 43233 Z=3:GOSUB2000:I(6)=0
 43235 IFI(8)=21THENI(9)=21:GOTOO
 43237 I(7)=21:GOTOO
 43240 IFV=15ANDN=21ANDI(16)=RTHENZ=80:GOSUB2000:GOTOO
 43250 IFN=20ANDI(15)=RTHENZ=5:GOSUB2000:GOTOO
 43260 IFN=20THENZ=4:GOSUB2000:GOTOO
 43270 GOTO5010
 43300 IFV=25ANDN=47THENZ=81:GOSUB2000:GOTOO
 43310 IFV=11ANDN=47THENZ=81:GOSUB2000:GOTOO
 43320 IFV=8ANDN=47THENZ=44:GOSUB2000:GOTOO
 43330 IFV=8ANDN=48THENZ=45:GOSUB2000:GOTOO
 43340 GOTO5010
 43350 GOTO5010 
 43400 GOTO5010
 43500 GOTO5010
 43600 GOTO5010
 43700 GOTO5010
 43800 IFV=1ANDN=23ANDI(17)=RTHENR=39:GOTOO
 43810 IFV=14ANDN=23THENZ=83:GOSUB2000:GOTOO
 43820 IFV=1ANDN=23THENPRINT"BANG.. (OUCH)":GOTOO
 43830 REM
 43840 GOTO5010
 43900 IFV=1ANDN=23THENR=38:GOTOO
 43910 GOTO5010
 44000 IFV=1ANDN=2ANDF(2)=1THENR=41:GOTOO
 44010 IFV=1ANDN=2THENZ=18:GOSUB2000:R=57:GOTOO
 44020 GOTO5010
 44100 GOTO5010
 44200 GOTO5010
 44300 GOTO5010
 44400 IFV=2ANDN=25ANDI(20)=0THENI(20)=R:GOTO5010
 44410 GOTO5010
 44500 IFV=16ANDN=1THENZ=30:GOSUB2000:R=6:GOTOO
 44510 IFV=16ANDN=3THENZ=30:GOSUB2000:R=46:GOTOO
 44520 IFV=16ANDN<7THENPRINT"The wall does not budge":GOTOO
 44530 IFV=16ANDN=43THENPRINT"Please say which wall, e.g. PUSH WEST":GOTOO
 44540 GOTO5010
 44600 IFV<>4ORN<>27THEN44620
 44605 IFI(2)=-1ANDI(18)=-1ANDI(21)=RTHENZ=34:GOSUB2000:I(21)=0:I(22)=R:GOTOO
 44610 IFI(18)<>-1THENZ=85:GOSUB2000:GOTOO
 44615 IFI(21)=R ANDI(2)<>-1THENZ=34:GOSUB2000:Z=35:GOSUB2000:R=57:GOTOO
 44620 IFV=1AND(N=3ORN=27ORN=53)ANDI(22)=0THENPRINT"The door's locked":GOTOO
 44630 GOTO5010
 44700 GOTO5010
 44800 GOTO5010
 44900 IFV=1ANDN=2ANDI(23)=RTHENZ=26:GOSUB2000:GOTOO
 44910 GOTO5010
 45000 IFV=1ANDN=3ANDI(25)=RTHENZ=24:GOSUB2000:GOTOO
 45010 GOTO5010
 45100 GOTO5010
 45200 GOTO5010
 45300 IFV=1AND(N=3ORN=56)ANDI(26)=RTHENZ=25:GOSUB2000:GOTOO
 45310 GOTO5010
 45400 IFN=16AND(V=3ORV=14ORV=17)THEN45405
 45403 GOTO45410
 45405 IFI(11)=-1THENZ=86:GOSUB2000:Z=87:GOSUB2000:I(11)=0:R=55:GOTOO
 45410 IFV=16ANDN=46THENZAP:WAIT10:EXPLODE:WAIT4:SHOOT:R=6:GOTOO
 45500 IFV=27ORN$="HOME"THENZ=89:GOSUB2000:R=1:GOTOO
 45510 IFV<>4ORN<>26THEN45540
 45515 IFI(37)<>0THENPRINT"The safe IS open!":GOTOO
 45520 CLS:PRINT"To do this you must enter a combin-   ation number"
 45525 INPUTZ$
 45530 IFSC=0ORSC<>VAL(Z$)THENPRINT"WRONG!":PRINT:PRINT:GOTOO
 45535 SOUND4,10,0:PLAY0,1,1,40:WAIT20:PLAY0,0,0,0
 45537 I(37)=R:I(31)=R:GOTOO
 45540 GOTO5010
 45600 GOTO5010
 50000 REM
 50002 HIRES:FORI=1TO150:CURSET1,I,3:FILL1,1,INT(RND(9)*7)+1:NEXT
 50005 FORX=1TO130STEP15
 50010 CURSET10,1,3:FILL199,1,10:Z$="WELL DONE!!"
 50020 FORZ=1TOLEN(Z$):CURSETX+30+6*Z,X,3:CHARASC(MID$(Z$,Z,1)),0,1:NEXT
 50025 NEXT
 50030 WAIT200:Z=10:GOSUB6500
 50040 PRINT"Have you tried ORIC ZODIAC, also in   this series?":WAIT300
 50050 PRINT:PRINT:PRINT"Makes other adventures (except this   one) look like noughts and";
 50070 PRINT" crosses!":WAIT300:TEXT:RETURN
 60000 HIRES:PAPER0:INK1
 60010 CURSET60,150,3:DRAW0,-40,1:DRAW10,-10,1:DRAW10,10,1
 60020 DRAW-20,0,1:DRAW20,0,1:DRAW0,40,1:DRAW0,-40,3:FORZ=1TO8
 60030 DRAW2,0,1:DRAW0,-3,1:DRAW4,0,1:DRAW0,3,1:DRAW2,0,1:NEXT
 60040 DRAW2,0,1:DRAW10,-10,1:DRAW10,10,1:DRAW-20,0,1:DRAW20,0,1
 60050 DRAW0,40,1:DRAW0,-40,3:DRAW-20,0,3:DRAW0,40,1
 60070 CURSET102,150,3:DRAW0,-18,1:DRAW4,-6,1:DRAW6,0,1:DRAW4,6,1:DRAW0,18,1
 60080 CURSET102,150,3:DRAW5,-3,1:DRAW0,-21,1:CURSET106,136,3:CIRCLE1,1
 60100 CURSET64,116,3:DRAW4,0,1:DRAW0,10,1:DRAW-4,0,1:DRAW0,-10,1
 60110 DRAW1,0,1:DRAW0,10,1:DRAW1,0,1:DRAW0,-10,1
 60120 CURSET74,116,3:DRAW4,0,1:DRAW0,10,1:DRAW-4,0,1:DRAW0,-10,1
 60140 CURSET100,114,3:DRAW10,0,1:DRAW0,7,1:DRAW-10,0,1:DRAW0,-7,1
 60150 CURSET105,118,3:CIRCLE2,1:CURSET85,112,3:FILL10,1,4
 60170 CURSET120,112,3:FILL10,1,1
 60180 CURSET103,114,3:DRAW0,7,1:CURSET105,114,3:DRAW0,7,1
 60190 CURSET108,114,3:DRAW0,7,1
 61000 CURSET155,117,3:DRAW4,0,1:DRAW0,10,1:DRAW-4,0,1:DRAW0,-10,1
 61005 CURSET180,100,3:FILL100,1,2
 61010 CURSET200,160,3:DRAW0,-10,1:CURSET200,140,1
 61020 FORZ=1TO10:CIRCLEZ,1:NEXT
 63000 RETURN
