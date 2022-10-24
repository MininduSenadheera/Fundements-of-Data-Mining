package Apriori;

import java.io.BufferedReader;
import java.io.FileReader;
import weka.core.Instances;
import weka.associations.Apriori;

public class AprioriAlgorithm {
    public static void main(String[] args) throws Exception {

        // loading the dataset
        Instances instances = new Instances(new BufferedReader(new FileReader("data/supermarket.arff")));
        
        // building the model
        Apriori model = new Apriori();

        // by default these things are no need to configure
        model.setDelta(0.05); // decrement of minSup per iteration
        model.setNumRules(8); // no.of rules (by default it's 10)
        model.setLowerBoundMinSupport(0.1); // lowest possible value for minSup
        model.setUpperBoundMinSupport(1); // initial minSup

        // build the associations
        model.buildAssociations(instances);
        System.out.println(model);
    }
}