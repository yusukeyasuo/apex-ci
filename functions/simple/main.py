print "start sample function"
def handle(event, context):
    print "processing event"
    return add_three(4)

def add_three(x):
    return x + 3
