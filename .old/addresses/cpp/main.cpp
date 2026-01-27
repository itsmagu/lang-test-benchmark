#include <cstdio>
#include "more.cpp"
#include "calcer.cpp"

int main() {
    printf("Main's Address is %p\n",&main);
    printf("Cool's Address is %p\n",&cool);
    calcFuncDist(reinterpret_cast<void(*)()>(&main),&cool);
    return 0;
}