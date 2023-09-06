const MyCartCounterReducer = (currentState=0, action) => {
    switch (action.type) {
        case "inc":
            return currentState + action.payload;
        case "dec":
            return currentState - action.payload;
        case "update":
            return action.payload;
    }

    return currentState;
}

export default MyCartCounterReducer;