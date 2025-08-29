import pytest

def multiplicar(a, b):
    """Función que multiplica dos números."""
    return a * b

def test_multiplicar():
    assert multiplicar(2, 3) == 6
    assert multiplicar(-1, 5) == -5
    assert multiplicar(0, 100) == 0
    assert multiplicar(-2, -4) == 8

@pytest.mark.xfail(reason="Este test está diseñado para fallar")
def test_multiplicar_fallo():
    pytest.xfail("Este test está diseñado para fallar")
    assert multiplicar(2, 3) == 5  # Este test está diseñado para fallar