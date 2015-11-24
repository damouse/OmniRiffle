from greenlet import greenlet

def test1():
    print 12
    gr2.switch()
    print 34

def test2():
    print 56
    gr1.switch()
    print 78

if __name__ == '__main__':
    gr1 = greenlet(test1)
    gr2 = greenlet(test2)
    gr1.switch()