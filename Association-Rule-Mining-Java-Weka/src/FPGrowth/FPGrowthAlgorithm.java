package FPGrowth;

import java.io.BufferedReader;
import java.io.FileReader;
import weka.associations.FPGrowth;
import weka.core.Instances;

public class FPGrowthAlgorithm {
    public static void main(String[] args) throws Exception {
        
        // loading the dataset
        Instances instances = new Instances(new BufferedReader(new FileReader("data/supermarket.arff")));

        // building the model
        FPGrowth model = new FPGrowth();

        // build the associations
        model.buildAssociations(instances);
        System.out.println(model);
    }
}
