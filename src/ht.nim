import macros

macro `<-`*(a: untyped, b: typed) =
    a.expectKind nnkTupleConstr
    a.expectLen(2, 2)
    let collections: set[NimTypeKind] = {ntyOpenArray, ntyArray, ntySequence}
    let ok = b.getType().typeKind() in collections
    if not ok:
        error("expected array, openArray, or sequence", b)

    let x = a[0]
    let y = a[1]

    quote do:
        var (`x`, `y`) = (`b`[0], `b`[1..^1])
