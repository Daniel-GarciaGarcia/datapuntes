
debugEnabled = True
def debug(fn):
    """
    Print parameters and return value of a function
    """
    def wrapper(*args,**kwargs):
        if debugEnabled:
            print(f"args={args} kwargs={kwargs}")
        ret = fn(*args,**kwargs)
        if debugEnabled:
            print(f"return={ret}")
        return ret
    return wrapper


def checkPositionals(*positionalTypes):
    """
    Check the positional types before calling a function
    """
    def decorate(fn):
        def wrapper(*args,**kwargs):
            typedCheck = [type(a)==b for a,b in zip(args,positionalTypes)]
            if all(typedCheck):
                return fn(*args,**kwargs)
            else:
                raise TypeError(f"Check the call to function, invalid types. {positionalTypes}")
        return wrapper
    return decorate