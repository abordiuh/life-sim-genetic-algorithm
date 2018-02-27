public enum ACTIONS {
  AStay, AMove, AEat, AKillAndEat, APassResources, AReproduce, ASIZE
};
public enum DIRECTIONS {
  TL, T, TR, L, C, R, LB, B, RB, DSIZE
};
int ActionsArraySize = 32;  

public class Action {
  int Direction = 0;
  int Action = 0;

  public Action() {
  }

  public Action(int Action, int Direction) {
    this.Action = Action;
    this.Direction = Direction;
  }

  public float Execute(SurroundArea area) {
    ACTIONS act = ACTIONS.values()[Action];
    //DIRECTIONS dir = DIRECTIONS.values()[Direction];
    float EnergyDiff = -0.05;
    switch(act) {
    case AStay : 
      {  
        break;
      } 
    case AMove : 
      {  
        if (area.SurrAreaType[Direction] != null && area.SurrAreaType[Direction].Type == EType.TEmpty) {
          area.SurrAreaType[Direction] = area.SurrAreaType[DIRECTIONS.C.ordinal()];
          area.SurrAreaType[DIRECTIONS.C.ordinal()] = new EmptyPlace();
          EnergyDiff = -1;
        }
        break;
      } 
    case AEat : 
      {  
        if (area.SurrAreaType[Direction] != null && area.SurrAreaType[Direction].Type == EType.TResource) {
          area.SurrAreaType[Direction] = new EmptyPlace();
          EnergyDiff = 1;
        } else if (Direction == DIRECTIONS.C.ordinal()) {
          for (int i = 0; i < 9; i++) {
            if (area.SurrAreaType[i] != null && area.SurrAreaType[i].Type == EType.TResource) {
              area.SurrAreaType[i] = new EmptyPlace();
              EnergyDiff += 1;
            }
          }
        }
        break;
      } 
    case AKillAndEat : 
      { 
        if (area.SurrAreaType[Direction] != null && Direction != DIRECTIONS.C.ordinal() && area.SurrAreaType[Direction].Type == EType.TBot) {
          area.SurrAreaType[Direction] = new EmptyPlace();
          EnergyDiff = 1;
        } 
        break;
      } 
    case APassResources : 
      {  
        break;
      }
    case AReproduce : 
      {  
        break;
      }
    default : 
      {  
        break;
      }
    }

    return EnergyDiff;
  }
}

public static class SurroundArea {
  public Entity SurrAreaType[] = new Entity[9];
}