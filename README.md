# Weather-app
Demo Project to understand how @State and @Binding variables work
Notes from developement
To add font 
1. Add font file (tried with .ttf) to project
2. Go to targets
3. Go to fonts and add your font file name

To use these custom fonts (on SwiftUI)
.font(.custom("BebasNeue-Regular", size: 16))

Notes about SwiftUI
- they are struct type
- @State variables hold the reference as the views gets created and destroyed
- If you don't give default value in @State then be prepared to give values when creating those views
- to make variable binding add $
- Cannot make @State variable private in this project because it is being accessed from outside
