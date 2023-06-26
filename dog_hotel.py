def dog_hotel(room_prices):
    n = len(room_prices)

    rooms = {key: [room_prices[key], 0] for key in range(n)}
    max_bill = 0

    for node_id in range(n):
        current_price = rooms[node_id][0]
        
        try:
            left_id = node_id - 3
            left_bill = rooms[left_id][1]
        except:
            left_bill = 0

        try:
            right_id = node_id - 2
            right_bill = rooms[right_id][1]
        except:
            right_bill = 0

        previous_bill = max(left_bill, right_bill)
        new_bill = current_price + previous_bill

        rooms[node_id][1] = new_bill

        max_bill = max(max_bill, new_bill)
    
    print(max_bill)

if __name__ == '__main__':
    #h = list(map(int, input().rstrip().split()))
    #h = list(map(int, '1 2 3 4 1 2 3 4'.rstrip().split()))
    #h = list(map(int, '1 2 3 4 5 6 7 8'.rstrip().split()))
    #h = list(map(int, '1 5 16 14 4 1'.rstrip().split()))
    h = list(map(int, '8 2 2 30 15'.rstrip().split()))
    dog_hotel(h)
