import macros

macro `<-`*(a: untyped, b: typed) =
    if not (a.kind() == nnkTupleConstr and a.len() == 2):
        error("left hand side must be a tuple constructor of length 2", a)

    if not (b.getType().typeKind() in {ntyOpenArray, ntyArray, ntySequence}):
        error("right hand side must be an openArray, array, or sequence", b)

    let x = a[0]
    let y = a[1]

    quote do:
        let (`x`, `y`) = (`b`[0], `b`[1..^1])
