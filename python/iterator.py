# iterable objects - could be used with for loop

for i in [1,2,3,4]:
  print i

for c in "python":
  print c

# iterates over keys by default
d = {"x":1, "y":2, "z":3}
for key in d:
  print key, 'corresponds to',d[key]

for line in open("a.txt"):
  print line


# there are many functions which consumes these iterables
print ",".join(["a", "b", "c"]) # str
print ",".join(d) # str
print list("python")
print list(d)

# iterator - iter()
# iter() - takes iterable objects and returns iterator

# x is an iterator
x = iter([1,2,3])
print x.next()
print x.next()
print x.next()

##############################
######### Generator ##########
##############################

# A generator is a function that produces a sequence of results
# instead of a single value. Simplifies CREATION OF ITERATORS
#  - is also an iterator
def yrange(n):
    i = 0
    while i < n:
        yield i
        i += 1

# each time yield is executed,the function generates a new value
y = yrange(3)
print y
print y.next()
print y.next()
print y.next()
# print y.next()


# yield and next
# i evaluated for each next call
# until yield statement
def foo():
    print "begin"
    for i in range(3):
        print "before yield", i
        yield i
        print "after yield", i
    print "end"

f = foo();
print type(f) # generator

f.next();
f.next();
f.next();






