import pytest

def suma(a, b):
    """Función que suma dos números."""
    return a + b

def test_suma():
    assert suma(2, 3) == 5
    assert suma(-1, 1) == 0
    assert suma(0, 0) == 0
    assert suma(-1, -1) == -2

def test_suma_fail():
    pytest.xfail("Este test está diseñado para fallar")
    assert suma(1, 2) == 4  # Este test está diseñado para fallar