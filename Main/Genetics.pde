import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Vector;
import java.util.Stack;

class GenAlgorithm {
  int PopulationSize;
  int GenomSize;

  int GenMaxValue;
  int GenMinValue;

  Population population;

  public GenAlgorithm(int PopulationSize, int GenomSize, int GenMinValue, int GenMaxValue) {
    this.PopulationSize = PopulationSize;
    this.GenomSize = GenomSize;
    this.GenMaxValue = GenMaxValue;
    this.GenMinValue = GenMinValue;

    population.InitializeRandomly(GenMinValue, GenMaxValue, GenomSize, PopulationSize);
  }
}

class Population {
  ArrayList<Genom> Genoms = new ArrayList<Genom>();
  
  public void InitializeRandomly(int MinValue, int ToMaxValue, int TotalNumbOfGenes, int PopulationSize){
    Genoms = new ArrayList<Genom>(PopulationSize); 
    
    for(Genom g : Genoms){
      g = new Genom(MinValue, ToMaxValue, TotalNumbOfGenes);
      g.GenerateRandomGenes();
    }
  }
}

class Genom {
  ArrayList<Integer> Genes = new ArrayList<Integer>();
  int MinValue; 
  int ToMaxValue; 
  int TotalNumbOfGenes;

  public Genom(int MinValue, int ToMaxValue, int TotalNumbOfGenes) {
    this.MinValue = MinValue;
    this.ToMaxValue = ToMaxValue;
    this.TotalNumbOfGenes = TotalNumbOfGenes;
  }

  void UpdateGenom( Genom genom ) {
    this.Genes = genom.Genes;
  }

  void GenerateRandomGenes() {
    Genes = new ArrayList<Integer>(TotalNumbOfGenes);
    for (Integer val : Genes) {
      val = (int)random(MinValue, ToMaxValue);
    }
  }

  void Mutate(int NumbOfGenes) {
    for (int i = 0; i<NumbOfGenes; i++) {
      int randomGene = (int)random(0, Genes.size());
      Integer retVal = Genes.get(randomGene);
      retVal = (int)random(MinValue, ToMaxValue);
      Genes.set(randomGene, retVal);
    }
  }
}