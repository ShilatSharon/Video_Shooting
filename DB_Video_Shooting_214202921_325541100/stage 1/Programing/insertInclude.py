import random

# Generate and print SQL insert statements
for order_id in range(400):
    professional_id = random.randint(0, 399)

    sql = f"INSERT INTO include (professional_id, order_id) VALUES ({professional_id}, {order_id});"
    print(sql)
