#!/usr/bin/env python3

import yaml
import argparse

def main():
    parser = argparse.ArgumentParser(description="Parse a MetaWorkflow YAML file to extract output files policies and tags.")
    parser.add_argument("filename", help="Path to the YAML file")
    args = parser.parse_args()
    
    with open(args.filename) as stream:
        d = yaml.safe_load(stream)
    
    for workflow, values in d['workflows'].items():
        print("\n-+ " + workflow.upper() + " " + "-" * (80 - len(workflow)))
        outputs = values['output']
        for output, values_ in outputs.items():
            s3_policies = values_.get('s3_lifecycle_category')
            output_status = values_.get('output_status')
            software = values_.get('software')
            annotation = values_.get('annotation')
            reference_genome = values_.get('reference_genome')
            alignment_details = values_.get('alignment_details')
            data_category = values_.get('data_category')
            data_type = values_.get('data_type')

            print("\n\t- " + output)
            print("\t\t.s3_policies: " + (s3_policies if s3_policies else "standard"))

            if data_category:
                print("\t\t.category: " + ", ".join(data_category))
            if data_type:
                print("\t\t.type: " + ", ".join(data_type))
            if output_status:
                print("\t\t.status: " + output_status)

            other = []
            if software:
                other.append(software[0])
            if annotation:
                other.append(annotation[0])
            if reference_genome:
                other.append(reference_genome)
            if alignment_details:
                other.append(alignment_details[0])

            if other:
                print("\t\t.annotations: " + ", ".join(other))
    print()

if __name__ == "__main__":
    main()
