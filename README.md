# 🔒 K-Anonymity Optimization Project

Este repositorio contiene tres enfoques para resolver un problema de optimización de **k-anonimato** al asignar individuos a recursos maximizando la privacidad:

- ✅ Modelo Exacto (MiniZinc)
- ⚙️ Heurístico (Python)
- 🧬 Metaheurístico (Python con algoritmos genéticos)

---

## 📁 Estructura del Repositorio

- `TFG.mzn`: Modelo en MiniZinc (enfoque exacto)

### Archivos de Datos para MiniZinc (`.dzn`)
- `M15.dzn`: Instancia pequeña (4 quasi-ID, 5 recursos, población 15)
- `M21.dzn`: Instancia media (5 quasi-ID, 5 recursos, población 30)
- `M50.dzn`: Instancia grande (8 quasi-ID, 6 recursos, población 50)

### Algoritmos
- `Heuristico_TFG.ipynb`: Algoritmo heurístico (greedy)
- `Metaheuristico_TFG.ipynb`: Algoritmo metaheurístico (genético)

---

## ⚙️ Requisitos

### Modelo Exacto
- [MiniZinc](https://www.minizinc.org/) 2.8+
- Algún solver compatible (por ejemplo, Gecode)
- IDE de MiniZinc (opcional)

### Heurístico / Metaheurístico
- Python 3.10
- Jupyter Notebook
- Librerías necesarias:
  ```bash
  pip install numpy tqdm inspyred matplotlib
  ```

---

## 🚀 Cómo Ejecutar los Modelos

### 1. Modelo Exacto (`TFG.mzn`)

- Abre la aplicación **MiniZinc**.
- Carga el archivo `TFG.mzn` y uno de los archivos de datos `.dzn` (por ejemplo, `M15.dzn`).
- Selecciona un **solver** compatible (como Gecode).
- Haz clic en **Run**, y asegúrate de que se esté utilizando el archivo `.dzn` correcto.
- Puedes probar diferentes instancias cambiando `M15.dzn` por `M21.dzn` o `M50.dzn`.

**Salida esperada**:
- Orden lexicográfico de asignación.
- Vector de anonimato.
- Asignaciones de pacientes a recursos.

📝 **Nota**: Este enfoque encuentra soluciones óptimas, pero puede no encuentra soluciones para instancias grandes en un tiempo razonable.

### 2. Modelo Heurístico (`Heuristico_TFG.ipynb`)

1. Abrir el notebook en Jupyter.
2. Configurar `sumas_filas` y `sumas_columnas`.  
   Ejemplo:
   ```python
   sumas_filas = [4, 4, 5, 2]
   sumas_columnas = [4, 2, 4, 3, 2]
   ```
3. Ejecutar todas las celdas.
4. **Salida**: Matriz de asignación, vector de anonimato, suma del vector.
5. ⚡ **Nota**: Rápido, pero con soluciones subóptimas.

---

### 3. Modelo Metaheurístico (`Metaheuristico_TFG.ipynb`)

1. Abrir el notebook en Jupyter.
2. Ajustar `sumas_filas` y `sumas_columnas`.
3. Ejecutar una configuración (por ejemplo `"RM"`, `"RP"`, `"RPmc"`).
4. **Salida**: Vectores de anonimato (mejor, peor, mediana), fitness, estadísticas de ejecución.
5. ⚖️ **Nota**: Equilibrio entre velocidad y calidad. Usa `inspyred` para algoritmos genéticos.

---

## 🧪 Pruebas

- Para instancias personalizadas, modifica los archivos `.dzn` o los inputs en los notebooks.

---


## 🐛 Problemas o Errores

Abre un *issue* en GitHub si encuentras errores o tienes dudas.

---