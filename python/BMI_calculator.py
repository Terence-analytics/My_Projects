# BMI calculator
weight = eval(input("WEIGHT (in pounds): "))
height = eval(input("HEIGHT (in inches): "))
BMI = round((weight*703) / (height*height), 2)
print("CALCULATE")
print("YOUR BMI IS:", BMI)
# \n new line
if BMI < 18.5:
    print("You are under weight.\nyour health is at minimal risk.")
elif (18.5 <= BMI) and (BMI < 24.9):
    print("Your weight is normal.\nyour health is at minimal risk.")
elif (29.9 <= BMI) and (BMI < 34.9):
    print("You are obese.\nyour health is at a high risk.")
elif (24.9 <= BMI) and (BMI < 29.9):
    print("You are overweight.\nyour health risk has increased.")
elif (34.9 <= BMI) and (BMI < 40):
    print("You are severely obese.\nyour health is at very high risk.")
else:
    print("You are morbidly obese. \n your health risk is extremely high.")
