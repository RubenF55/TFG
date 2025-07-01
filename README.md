K-Anonymity Optimization Project
This repository contains three approaches to solve a k-anonymity optimization problem for assigning individuals to resources while maximizing privacy: Exact Model (MiniZinc), Heuristic (Python), and Metaheuristic (Python with genetic algorithms).
Repository Structure

TFG.mzn: MiniZinc model for the exact approach.
Data Files:
M15.dzn: Small instance (4 quasi-IDs, 5 resources, pop. 15).
M21.dzn: Medium instance (5 quasi-IDs, 5 resources, pop. 30).
M50.dzn: Large instance (8 quasi-IDs, 6 resources, pop. 50).


Heuristico_TFG.ipynb: Heuristic algorithm (greedy, Python).
Metaheuristico_TFG.ipynb: Metaheuristic algorithm (genetic, Python).

Prerequisites

Exact Model: MiniZinc (2.8+), solver (e.g., Gecode), MiniZinc IDE (optional).
Heuristic/Metaheuristic:
Python 3.10, Jupyter Notebook.
Libraries: numpy, tqdm, inspyred, matplotlib.pip install numpy tqdm inspyred matplotlib





Running the Models
1. Exact Model (TFG.mzn)

Run with MiniZinc CLI:minizinc TFG.mzn M15.dzn

Replace M15.dzn with M21.dzn or M50.dzn for other instances.
Output: Lexicographic order, anonymity vector, patient assignments.
Notes: Optimal but slow for large instances (e.g., M50.dzn).

2. Heuristic Model (Heuristico_TFG.ipynb)

Open Heuristico_TFG.ipynb in Jupyter.
Set sumas_filas and sumas_columnas (e.g., [4, 4, 5, 2], [4, 2, 4, 3, 2] for M15.dzn).
Run all cells.
Output: Assignment matrix, anonymity vector, sum of vector values.
Notes: Fast, suboptimal solutions.

3. Metaheuristic Model (Metaheuristico_TFG.ipynb)

Open Metaheuristico_TFG.ipynb in Jupyter.
Set sumas_filas and sumas_columnas to match a .dzn file.
Run a configuration (e.g., "RM", "RP", "RPmc").
Output: Best/worst/median anonymity vectors, fitness, and execution time stats.
Notes: Balances speed and quality, uses inspyred for genetic algorithms.

Testing

Use M15.dzn, M21.dzn, or M50.dzn for testing.
Modify .dzn files or notebook inputs for custom instances.

Contributing
Submit pull requests or issues for improvements. Ensure new .dzn files match the format.
License
MIT License (see LICENSE).

For issues, open a ticket on GitHub.