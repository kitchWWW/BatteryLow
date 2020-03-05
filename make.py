import random
import sys
import os

timestamp = str(sys.argv[1])
lowNote = int(sys.argv[2])
highNote = int(sys.argv[3])
howLong = int(sys.argv[4]) # 1 = 6 ish minutes, 8 = 12 ish # ZERO IS OUT OF BOUNDS

# TODO : take this in as arguments


# veryify range of insturment
pitchClass = [0,2,4,5,7,9,11]

if highNote - lowNote < 12:
	# throw error "range is not large enough"
	exit()
if howLong < 1 or howLong >7:
	# it will force us to loop forever if low, or no change if too high
	exit()

# Select pitch material
options = [[],[],[],[],[],[],[]]

for i in range(lowNote,highNote+1):
	if i%12 in pitchClass:
		options[pitchClass.index(i%12)].append(i)
print "options"
print options

goodToGo = False
while not goodToGo:
	goodToGo = True
	usingThisTime = []
	for o in options:
		usingThisTime.append(random.choice(o))
	for o in options[:howLong]:
		usingThisTime.append(random.choice(o))
		
	random.shuffle(usingThisTime)

	for i in range(len(usingThisTime)-1):
		dist = (abs(usingThisTime[i] - usingThisTime[i+1]))
		if dist < 3:
			goodToGo = False
	print dist
print "pitches"
print usingThisTime




# Select which notes to be played with what side of stick
loud = []
goodToGo = False
while not goodToGo:
	playNormal = 1 + (len(usingThisTime)/2)
	print playNormal
	if playNormal < 5:
		playNormal = 5

	loud = random.sample(range(len(usingThisTime) - 4)[1:], playNormal-4 )
	for i in range(4):
		loud.append(len(usingThisTime)+i-4)
	loud.sort()

	goodToGo = True

	breaksAtLeastOnce = False
	for i in range(len(loud)-1):
		if loud[i] != loud[i+1]-1:
			breaksAtLeastOnce = True
	if not breaksAtLeastOnce:
		goodToGo = False

	finalThreeSoft = []
	for i in range(len(usingThisTime)):
		if i not in loud:
			finalThreeSoft.append(i)
		if len(finalThreeSoft)>3:
			del finalThreeSoft[0]
	if len(finalThreeSoft) != 3:
		goodToGo = False

# print finalThreeSoft


print "loud"
print(loud)
print "final three soft"
print finalThreeSoft






# Select rhythmic variations

rhythms = {
	0: "slow quarter random",
	1: "fast quarter random",	
	2: "heart beat with space",
	3: "fast heart no space",
	4: "roll",
	5: "sixteenth notes",
	6: "roll again",
	7: "roll some more"
}

goodToGo = False
while not goodToGo:
	goodToGo = True
	rhythmsToUse = [0]
	for i in range(len(usingThisTime)-2):
		rhythmsToUse.append(random.choice(rhythms.keys()))
	rhythmsToUse.append(1)
	
	for i in range(6):
		if(i not in rhythmsToUse):
			goodToGo = False
	for i in range(len(rhythmsToUse)-2):
		if rhythmsToUse[i] == rhythmsToUse[i+1] and rhythmsToUse[i] == rhythmsToUse[i+2]:
			goodToGo = False
		

print "rhythms"
print rhythmsToUse




# And then combine them together with dynamics

dynamics = []
stickCount = 0
headCount = 0
for i in range(len(usingThisTime)):
	if i in loud:
		dynamics.append(headCount)
		headCount+=1
	else:
		dynamics.append(stickCount)
		stickCount+=1

allDynamics = ["ppp","pp","p","mp","mf","f","ff","fff"]

stickStep = len(allDynamics) / (stickCount+0.0)
headStep = len(allDynamics) / (headCount+0.0)
stickCurrent = 0.0
headCurrent = 0.0
newDynamics = []
for i in range(len(dynamics)):
	if i in loud:
		newDynamics.append(allDynamics[int(round(headCurrent))])
		headCurrent+=headStep
	else:
		newDynamics.append(allDynamics[int(round(stickCurrent))])
		stickCurrent+=stickStep
print newDynamics
		







############# SCORE BUILDING #######################

def genNote(myInt):
	notes = ['c','cis','d','ees','e','f','fis','g','aes','a','bes','b']
	octave = int(myInt / 12) - 4
	if octave >= 1:
		return notes[myInt%12]+("'"*octave)
	else:
		return notes[myInt%12]+(","*abs(octave))


fd = open("graphicScore.ly")
os.mkdir("out/"+timestamp)
fdo = open("out/"+timestamp+"/score.ly",'w')

fdtemplate = open("basicPart.ly")
scoreTemplate = "".join(fdtemplate.readlines())

partTemplates = []
for i in range(8):
	newTemplatefd = open("rhythms/rhythm"+str(i)+".ly")
	newTemplate = "".join(newTemplatefd.readlines())
	partTemplates.append(newTemplate)

glissTemplate = "".join(open("rhythms/gliss.ly").readlines())

scoreCount = 0
for l in fd.readlines():
	if howLong <= 4:
		l = l.replace("%vspace",'#2')
	else:
		l = l.replace("%vspace",'#1')

	if l.startswith("%score"):
		if scoreCount < len(usingThisTime):
			# write the normal 
			scoreInstance = scoreTemplate
			scoreInstance = scoreInstance.replace("%number",str(scoreCount+1))


			partInstance = partTemplates[rhythmsToUse[scoreCount]]
			if scoreCount in loud:
				partInstance = partInstance.replace("|xNotes|","\\xNotesOff")
			else:
				partInstance = partInstance.replace("|xNotes|","\\xNotesOn")

			partInstance = partInstance.replace("|dynamic|",newDynamics[scoreCount]) # change to lookup
			partInstance = partInstance.replace("|note|",genNote(usingThisTime[scoreCount])) # change to lookup


			scoreInstance = scoreInstance.replace("%part",partInstance)
			fdo.write(scoreInstance)
			scoreCount+=1
		elif scoreCount == len(usingThisTime):
			# write the final bit, the gliss
			scoreInstance = scoreTemplate
			scoreInstance = scoreInstance.replace("%number","End")

			partInstance = glissTemplate
			partInstance = partInstance.replace("|xNotes|","\\xNotesOff")
			partInstance = partInstance.replace("|low|",genNote(lowNote))
			partInstance = partInstance.replace("|high|",genNote(highNote))

			scoreInstance = scoreInstance.replace("%part",partInstance)
			fdo.write(scoreInstance)
			scoreCount+=1

	else:
		fdo.write(l)


fdo.close()
fd.close()



#################### MAKE THE QLIST FOR MAX ################

def QToLet(qnumber):
	return chr(65+qnumber)



fdQ = open("out/"+timestamp+"/qlist.txt",'w')
fdQ.write('status "q list loaded";\n')

for i in range(len(usingThisTime)):
	q = QToLet(i)
	fdQ.write("mt"+q+" vol 0;\n")
	fdQ.write("mt"+q+" rec 0;\n")
	fdQ.write("mt"+q+" clear;\n")

fdQ.write("""v21 .5;
qcontrol stop;
status "setup complete";
0;
v21 1 600000;

""")

for i in range(len(usingThisTime)):
	q = QToLet(i)
	if i > 1:
		fdQ.write("mt"+QToLet(i-2)+" vol .3 60000;\n")
	if i > 0:
		fdQ.write("mt"+QToLet(i-1)+" vol .7 15000;\n")
	fdQ.write("mt"+q+" rec 1;\n")
	fdQ.write('status "recording on '+q+'";\n')
	fdQ.write('qcontrol 10000;\n')
	fdQ.write('1'+str(i)+'0;\n')
	fdQ.write("mt"+q+" vol 1 8000;\n")
	if i == finalThreeSoft[2]:
		fdQ.write("mt"+QToLet(finalThreeSoft[0])+" vol .8 8000;\n")
		fdQ.write("mt"+QToLet(finalThreeSoft[1])+" vol .8 8000;\n")
		fdQ.write("mt"+QToLet(finalThreeSoft[0])+" dir 0;\n")
		fdQ.write("mt"+QToLet(finalThreeSoft[1])+" dir 0;\n")
	if i == finalThreeSoft[2]+1:
		fdQ.write("mt"+QToLet(finalThreeSoft[0])+" vol .3 15000;\n")
		fdQ.write("mt"+QToLet(finalThreeSoft[1])+" vol .3 15000;\n")
		fdQ.write("mt"+QToLet(finalThreeSoft[0])+" dir 1;\n")
		fdQ.write("mt"+QToLet(finalThreeSoft[1])+" dir 1;\n")
	if i == len(usingThisTime)-2:
		fdQ.write("mt"+QToLet(loud[0])+" vol .8 15000;\n")
		fdQ.write("mt"+QToLet(loud[1])+" vol .8 15000;\n")
	if i == len(usingThisTime)-1:
		fdQ.write("mt"+QToLet(loud[0])+" dir 0;\n")
		fdQ.write("mt"+QToLet(loud[1])+" dir 0;\n")
		fdQ.write("mt"+QToLet(loud[0])+" vol .5 15000;\n")
		fdQ.write("mt"+QToLet(loud[1])+" vol .5 15000;\n")
		fdQ.write("mt"+QToLet(loud[2])+" vol .8 15000;\n")
		fdQ.write("mt"+QToLet(loud[3])+" vol .8 15000;\n")
	fdQ.write('status "done recording on '+q+'";\n')
	fdQ.write('1'+str(i)+'1;\n')


# the "fadeout" que
for i in range(len(usingThisTime)):
	q = QToLet(i)
	fdQ.write('mt'+q+' vol 0 300;\n')

fdQ.write('status "Fading Out...";\n')
fdQ.write('qcontrol 300;\n')
fdQ.write('99999;\n')

fdQ.write('status "Done Fading Out!";\n')
fdQ.write('999999;\n')























