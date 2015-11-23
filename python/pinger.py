import riffle
from twisted.internet import reactor


@riffle.inlineCallbacks
def main():
    d = yield riffle.FabricSession.start("xs.damouse.python")

    result = yield d.absCall(u"xs.damouse.go/sub", 1, 2)
    print "Call done: ", result

if __name__ == '__main__':
    riffle.setDevFabric()
    reactor.callLater(0, main)
    reactor.run()
