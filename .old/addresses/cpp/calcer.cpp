int calcFuncDist(void (*a)(), void (*b)())
{
    auto aint = intptr_t(a);
    auto bint = intptr_t(b);
    if (aint > bint) printf("%d", aint - bint);
    else printf("%d", bint - aint);
}
