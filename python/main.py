
from twisted.internet import reactor, defer
import ctypes
riffle = ctypes.cdll.LoadLibrary('./libriff.so')


def react():
    '''
    Homeade reactor class. We could use a connection here?
    '''
    
    pass

if __name__ == '__main__':
    print riffle.Test()