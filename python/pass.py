employees = {"Alex": 5000, "Bob":2000, "Cathy":1000}

def test(employees):
    new = {"Damon":500, "Eugene":100}
    employees.update(new)
    print "inside function", employees
    return

test(employees)
print "outside function", employees