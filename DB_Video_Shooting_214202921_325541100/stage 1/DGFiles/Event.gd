
[General]
Version=1

[Preferences]
Username=
Password=2716
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SHILAT1
Name=EVENT
Count=400

[Record]
Name=EVENT_ID
Type=NUMBER
Size=5
Data=Sequence(0, [Inc], [WithinParent])
Master=

[Record]
Name=EVENT_DATE
Type=DATE
Size=
Data=Random(1/1/2000, 20/5/2024)
Master=

[Record]
Name=PLACE
Type=VARCHAR2
Size=20
Data=List("Conference Center", "Grand Hall", "Exhibition Hall", "Banquet Hall", "Event Arena")
Master=

